import 'package:flutter/material.dart';

import '../../../domain/repository/firebase_auth_repository.dart';

class AccountViewModel with ChangeNotifier {
  final bool _isLoading = true;
  final FirebaseAuthRepository _firebaseAuthRepository;

  AccountViewModel({
    required FirebaseAuthRepository firebaseAuthRepository,
  }) : _firebaseAuthRepository = firebaseAuthRepository;

  bool get isLoading => _isLoading;

  Future<void> logOut() async {
    await _firebaseAuthRepository.signOut();
  }
}
