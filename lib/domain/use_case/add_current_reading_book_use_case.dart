import 'package:untitled9/domain/repository/user_repository.dart';

import '../model/book.dart';

class AddCurrentReadingBookUseCase {
  final UserRepository _userRepository;

  const AddCurrentReadingBookUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  Future<void> execute({required String userId, required Book book}) async {
    _userRepository.addCurrentReadingBookToUser(userId: userId, book: book);
  }
}
