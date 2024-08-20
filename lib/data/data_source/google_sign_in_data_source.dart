import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInDataSource {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<GoogleSignInAccount?> signIn() async {
    try {
      return await _googleSignIn.signIn();
    } catch (error) {
      print('Google sign-in failed: $error');
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
    } catch (error) {
      print('Google sign-out failed: $error');
    }
  }

  Future<GoogleSignInAuthentication?> getAuthentication(GoogleSignInAccount? googleUser) async {
    try {
      return await googleUser?.authentication;
    } catch (error) {
      print('Failed to get Google authentication: $error');
      return null;
    }
  }
}