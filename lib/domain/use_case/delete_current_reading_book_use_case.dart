import 'package:untitled9/domain/repository/user_repository.dart';

import '../model/book.dart';

class DeleteCurrentReadingBookUseCase {
  final UserRepository _userRepository;

  const DeleteCurrentReadingBookUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  Future<void> execute({required String userId, required Book book}) async {
    await _userRepository.deleteCurrentReadingBookToUser(userId: userId, book: book);
  }
}
