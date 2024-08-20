import 'package:firebase_auth/firebase_auth.dart';

abstract interface class FirebaseAuthRepository{
  Future<UserCredential?> signInWithGoogle();
  Future<void> signOut();
}