import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountViewModel with ChangeNotifier {
  final bool _isLoading = true;

  AccountViewModel() {}


   bool get isLoading => _isLoading;
}
