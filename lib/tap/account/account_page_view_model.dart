import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountViewModel with ChangeNotifier {
  User? _user;
  bool _isLoading = true;

  AccountViewModel() {

  }

  User? get user => _user;
  bool get isLoading => _isLoading;

  // Future<void> fetchUserInfo() async {
  //   try {
  //     _user = FirebaseAuth.instance.currentUser;
  //   } catch (e) {
  //     // Handle the error
  //     print('Error fetching user info: $e');
  //   } finally {
  //     _isLoading = false;
  //     notifyListeners();
  //   }
  // }
}