import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:untitled9/data/data_source/kakao_sign_in_data_source.dart';
import 'package:untitled9/domain/repository/kakao_auth_repository.dart';

class KakaoAuthRepositoryImpl implements KakaoAuthRepository {
  final KakaoSignInDataSource _dataSource;

  KakaoAuthRepositoryImpl({required KakaoSignInDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future<User?> signInWithKakao() async {
    return await _dataSource.signIn();
  }

  @override
  Future<void> signOut() async {
    await _dataSource.signOut();
  }
}