import 'package:untitled9/data/data_source/user_data_source.dart';

import '../../domain/model/user.dart';

class UserRepositoryImpl {
  final UserDataSource _userDataSource;

  UserRepositoryImpl({required UserDataSource userDataSource})
      : _userDataSource = userDataSource;

  Future<void> createUser({required User user}) async {
    try {
      await _userDataSource.createUser(user: user);
    } catch (e) {
      throw Exception('fail : $e');
    }
  }

  Future<User?> getUser({required String userId}) async {
    try {
      return await _userDataSource.getUser(userId: userId);
    } catch (e) {
      throw Exception('fail : $e');
    }
  }

  Future<void> updateUser({required User user}) async {
    try {
      await _userDataSource.updateUser(user: user);
    } catch (e) {
      throw Exception('fail : $e');
    }
  }

  Future<void> deleteUser({required String userId}) async {
    try {
      await _userDataSource.deleteUser(userId: userId);
    } catch (e) {
      throw Exception('fail : $e');
    }
  }
}
