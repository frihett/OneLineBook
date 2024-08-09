import '../model/user.dart';

abstract interface class UserRepository {
  Future<void> createUser({required User user});

  Future<User?> getUser({required String userId});

  Future<void> updateUser({required User user});

  Future<void> deleteUser({required String userId});
}
