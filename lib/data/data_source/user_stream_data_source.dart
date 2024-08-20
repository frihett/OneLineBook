import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/model/book.dart';
import '../../domain/model/user.dart';

class UserStreamDataSource {
  final _userCollectionRef = FirebaseFirestore.instance
      .collection('users')
      .withConverter(
          fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
          toFirestore: (snapshot, _) => snapshot.toJson());

  Stream<User?> getUserStream({required String userId}) {
    return _userCollectionRef
        .doc(userId)
        .snapshots()
        .map((snapshot) => snapshot.data());
  }

  Stream<List<Book>> getCurrentReadingBookList({required String userId}) {
    return _userCollectionRef
        .doc(userId)
        .snapshots()
        .map((snapshot) => snapshot.data()?.currentReadingBookList ?? []);
  }
}
