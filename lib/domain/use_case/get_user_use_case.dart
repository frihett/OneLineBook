import 'package:untitled9/domain/repository/user_repository.dart';

import '../model/user.dart';

class GetUserUseCase {
  final UserRepository _userRepository;

  GetUserUseCase({required UserRepository userRepository})
      : _userRepository = userRepository;

  Future<User?> execute({required String userId}) async {
    return await _userRepository.getUser(userId: userId);
  }
}
