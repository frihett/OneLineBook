import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  Future<void> fetchUserInfo() async {
    try {
      _user = FirebaseAuth.instance.currentUser!;
    } catch (e) {
      // Handle the error
      print('Error fetching user info: $e');
    } finally {
      notifyListeners();
    }
  }
}
