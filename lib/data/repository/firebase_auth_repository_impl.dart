import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/repository/firebase_auth_repository.dart';
import '../data_source/google_sign_in_data_source.dart';

class FirebaseAuthRepositoryImpl implements FirebaseAuthRepository{
  final GoogleSignInDataSource _googleSignInDataSource;

  FirebaseAuthRepositoryImpl({required GoogleSignInDataSource googleSignInDataSource})
      : _googleSignInDataSource = googleSignInDataSource;

  Future<UserCredential?> signInWithGoogle() async {
    // 데이터 소스에서 구글 로그인 시도
    final googleUser = await _googleSignInDataSource.signIn();

    if (googleUser == null) {
      return null; // 로그인 실패 시 null 반환
    }

    // 데이터 소스에서 인증 정보 가져오기
    final googleAuth =
        await _googleSignInDataSource.getAuthentication(googleUser);

    if (googleAuth == null) {
      return null; // 인증 정보 가져오기 실패 시 null 반환
    }

    // 자격 증명 생성
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Firebase Auth로 로그인 시도 및 UserCredential 반환
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    await _googleSignInDataSource.signOut();
    await FirebaseAuth.instance.signOut(); // Firebase 로그아웃
  }


}
