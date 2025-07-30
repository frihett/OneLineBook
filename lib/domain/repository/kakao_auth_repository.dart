import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

abstract class KakaoAuthRepository {
  Future<User?> signInWithKakao();
  Future<void> signOut();
}