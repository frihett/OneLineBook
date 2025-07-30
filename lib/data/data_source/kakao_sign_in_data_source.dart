import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class KakaoSignInDataSource {
  Future<User?> signIn() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();

      OAuthToken token = isInstalled
          ? await UserApi.instance.loginWithKakaoTalk()
          : await UserApi.instance.loginWithKakaoAccount();

      if (token != null) {
        final user = await UserApi.instance.me();
        print(user.kakaoAccount?.email);
        print(user.kakaoAccount?.profile?.profileImageUrl);
        print(user.kakaoAccount?.profile?.nickname);

        return user;
      }
    } catch (e) {
      print('카카오 로그인 실패: $e');
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await UserApi.instance.logout();
    } catch (e) {
      print('카카오 로그아웃 실패: $e');
    }
  }
}
