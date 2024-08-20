import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:untitled9/domain/use_case/create_user_use_case.dart';

import '../../../core/provider/user_provider.dart';
import '../../../domain/model/user.dart';
import '../../../domain/repository/firebase_auth_repository.dart';
import '../../../domain/use_case/get_user_use_case.dart';

class LoginPageViewModel extends ChangeNotifier {
  final FirebaseAuthRepository _firebaseAuthRepository;

  LoginPageViewModel({
    required FirebaseAuthRepository firebaseAuthRepository,
    required UserProvider userProvider,
  }) : _firebaseAuthRepository = firebaseAuthRepository;

  Future<auth.UserCredential?> signInWithGoogle() async {
    return await _firebaseAuthRepository.signInWithGoogle();
  }

  Future<void> signOut() async {
    await _firebaseAuthRepository.signOut();
  }

  Future<User> setUpUser(auth.UserCredential userCredential) async {
    return User(
        userId: userCredential.user!.uid,
        userName: userCredential.user!.displayName!,
        email: userCredential.user!.email!,
        profilePictureUrl: userCredential.user!.photoURL!,
        createAt: DateTime.now().microsecondsSinceEpoch.toString());
  }
}
