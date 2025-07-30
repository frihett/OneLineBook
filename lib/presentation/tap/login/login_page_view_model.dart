import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:untitled9/domain/repository/kakao_auth_repository.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;
import '../../../domain/model/user.dart';
import '../../../domain/repository/firebase_auth_repository.dart';
import '../../../domain/repository/user_repository.dart';

class LoginPageViewModel extends ChangeNotifier {
  final FirebaseAuthRepository _firebaseAuthRepository;
  final KakaoAuthRepository _kakaoAuthRepository;

  final UserRepository _userRepository;

  LoginPageViewModel({
    required UserRepository userRepository,
    required FirebaseAuthRepository firebaseAuthRepository,
    required KakaoAuthRepository kakaoAuthRepository,
  })  : _firebaseAuthRepository = firebaseAuthRepository,
        _kakaoAuthRepository = kakaoAuthRepository,
        _userRepository = userRepository;

  //구글 로그인
  Future<auth.UserCredential?> signInWithGoogle() async {
    return await _firebaseAuthRepository.signInWithGoogle();
  }

  //카카오 로그인
  Future<kakao.User?> signInWithKakao() async {
    return await _kakaoAuthRepository.signInWithKakao();
  }

  Future<void> signOut() async {
    await _firebaseAuthRepository.signOut();
  }

  Future<User> setUpUserFromGoogle(auth.UserCredential userCredential) async {
    final user =
        await _userRepository.getUser(userId: userCredential.user!.uid);
    if (user != null) {
      return user;
    }
    return User(
        userId: userCredential.user!.uid,
        userName: userCredential.user!.displayName!,
        email: userCredential.user!.email!,
        profilePictureUrl: userCredential.user!.photoURL!,
        createAt: DateTime.now().microsecondsSinceEpoch.toString());
  }

  Future<User> setUpUserFromKakao(kakao.User kakaoUser) async {
    final userId = kakaoUser.id.toString();
    final user = await _userRepository.getUser(userId: userId);
    if (user != null) return user;

    return User(
      userId: userId,
      userName: kakaoUser.kakaoAccount?.profile?.nickname ?? "카카오 사용자",
      email: kakaoUser.kakaoAccount?.email ?? "",
      profilePictureUrl: kakaoUser.kakaoAccount?.profile?.profileImageUrl ?? "",
      createAt: DateTime.now().microsecondsSinceEpoch.toString(),
    );
  }
}
