import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountViewModel with ChangeNotifier {
  User? _user;
  bool _isLoading = true;

  AccountViewModel() {}

  User? get user => _user;

  bool get isLoading => _isLoading;
}
