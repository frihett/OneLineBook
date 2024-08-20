import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/model/book.dart';
import '../../domain/model/review.dart';
import '../../domain/model/user.dart';

class UserDataSource {
  final _userCollectionRef = FirebaseFirestore.instance
      .collection('users')
      .withConverter<User>(
          fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
          toFirestore: (snapshot, _) => snapshot.toJson());

  //Create
  Future<void> createUser({required User user}) async {
    await _userCollectionRef.doc(user.userId).set(user);
  }

  //Read
  Future<User?> getUser({required String userId}) async {
    final docSnapshot = await _userCollectionRef.doc(userId).get();
    return docSnapshot.data();
  }

  //Update
  Future<void> updateUser({required User user}) async {
    await _userCollectionRef.doc(user.userId).update(user.toJson());
  }

  //Delete
  Future<void> deleteUser({required String userId}) async {
    await _userCollectionRef.doc(userId).delete();
  }

  Future<void> addReviewToUser(
      {required String userId, required Review review}) async {
    await _userCollectionRef.doc(userId).update({
      'reviewList': FieldValue.arrayUnion([review.toJson()])
    });
  }

  Future<void> deleteReviewToUser(
      {required String userId, required Review review}) async {
    await _userCollectionRef.doc(userId).update({
      'reviewList': FieldValue.arrayRemove([review.toJson()])
    });
  }

  Future<void> addCurrentReadingBookToUser(
      {required String userId, required Book book}) async {
    await _userCollectionRef.doc(userId).update({
      'currentReadingBookList': FieldValue.arrayUnion([book.toJson()])
    });
  }

  Future<void> deleteCurrentReadingBookToUser(
      {required String userId, required Book book}) async {
    await _userCollectionRef.doc(userId).update({
      'currentReadingBookList': FieldValue.arrayRemove([book.toJson()])
    });
  }

  Future<void> updateUsersReview(
      {required String userId,
      required String reviewContent,
      required Review review}) async {
    // 1. 기존의 리뷰 삭제
    try {
      await _userCollectionRef.doc(userId).update({
        'reviewList': FieldValue.arrayRemove([review.toJson()])
      });

      // 2. 리뷰 객체 업데이트하기

      final updatedReview = review.copyWith(content: reviewContent);

      // 3. 업데이트된 리뷰 저장하기
      await _userCollectionRef.doc(userId).update({
        'reviewList': FieldValue.arrayUnion([updatedReview.toJson()])
      });
    } catch (e) {
      throw Exception('updateUserReview fail : $e');
    }
  }
}
