import 'package:cloud_firestore/cloud_firestore.dart';

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
}
