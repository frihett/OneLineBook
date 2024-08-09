import 'package:untitled9/domain/repository/user_repository.dart';

import '../model/user.dart';

class CreateUserUseCase {
  final UserRepository _userRepository;

  CreateUserUseCase({required UserRepository userRepository})
      : _userRepository = userRepository;

  Future<void> execute({required User user}) async {
    await _userRepository.createUser(user: user);
  }
}
