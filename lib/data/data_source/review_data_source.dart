import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/model/review.dart';

class ReviewDataSource {
  final _reviewCollectionRef = FirebaseFirestore.instance
      .collection('reviews')
      .withConverter<Review>(
          fromFirestore: (snapshot, _) => Review.fromJson(snapshot.data()!),
          toFirestore: (review, _) => review.toJson());

  //Create
  Future<Review?> createReview({required Review review}) async {
    try {
      final newDocRef = _reviewCollectionRef.doc();
      final reviewWithId = review.copyWith(reviewId: newDocRef.id);
      await newDocRef.set(reviewWithId);
      final docSnapshot = await newDocRef.get();
      return  docSnapshot.data();
    } catch (e) {
      print('Error creating review: $e'); // 에러 메시지 출력
      rethrow;
    }
  }

  //Read
  Future<Review?> getReview({required String reviewId}) async {
    final docSnapshot = await _reviewCollectionRef.doc(reviewId).get();
    return docSnapshot.data();
  }

  //Update
  Future<void> updateReview({required Review review}) async {
    await _reviewCollectionRef.doc(review.reviewId).update(review.toJson());
  }

  Future<void> editReview(
      {required Review review, required String reviewContent}) async {
    try {
      // 리뷰 수정
      await _reviewCollectionRef.doc(review.reviewId).update({
        'content': reviewContent,
        'updatedAt': DateTime.now().microsecondsSinceEpoch.toString()
      });
    } catch (e) {
      print('review datasource reviewId11111111111111111');
      print(review.reviewId);
      throw Exception('review Data Source editReview fail : $e');
    }
  }

  //Delete
  Future<void> deleteReview({required String reviewId}) async {
    await _reviewCollectionRef.doc(reviewId).delete();
  }
}
