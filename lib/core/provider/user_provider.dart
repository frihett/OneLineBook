import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/cupertino.dart';
import 'package:untitled9/domain/use_case/create_user_use_case.dart';

import '../../domain/model/user.dart';
import '../../domain/use_case/get_user_use_case.dart';

class UserProvider extends ChangeNotifier {
  final GetUserUseCase _getUserUseCase;
  final CreateUserUseCase _createUserUseCase;

  UserProvider({
    required GetUserUseCase getUserUseCase,
    required CreateUserUseCase createUserUseCase,
  })  : _getUserUseCase = getUserUseCase,
        _createUserUseCase = createUserUseCase;

  User? _user;

  User? get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners(); // UI 업데이트를 위해 호출
  }

  void clearUser() {
    _user = null;
    notifyListeners(); // UI 업데이트를 위해 호출
  }

  Future<void> saveUser(User user) async {
    await _createUserUseCase.execute(user: user);
  }

  Future<User?> fetchUser(String userId) async {
    return _getUserUseCase.execute(userId: userId);
  }

  Future<String> getUserId() async{
    return auth.FirebaseAuth.instance.currentUser!.uid;
  }
}
