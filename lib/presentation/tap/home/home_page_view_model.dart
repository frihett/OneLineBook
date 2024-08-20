import 'package:flutter/cupertino.dart';
import 'package:untitled9/domain/repository/book_repository.dart';

import '../../../domain/model/book.dart';
import '../../../domain/model/user.dart';
import '../../../domain/repository/user_stream_repository.dart';
import '../../../domain/use_case/delete_current_reading_book_use_case.dart';

class HomePageViewModel with ChangeNotifier {
  final UserStreamRepository _userStreamRepository;
  final DeleteCurrentReadingBookUseCase _deleteCurrentReadingBookUseCase;

  HomePageViewModel(
      {required UserStreamRepository userStreamRepository,
      required DeleteCurrentReadingBookUseCase deleteCurrentReadingBookUseCase})
      : _userStreamRepository = userStreamRepository,
        _deleteCurrentReadingBookUseCase = deleteCurrentReadingBookUseCase;

  Stream<User?> getUserStream({required String userId}) {
    return _userStreamRepository.getUserStream(userId: userId);
  }

  Future<void> deleteCurrentReadingBook(
      {required String userId, required Book book}) async {
    await _deleteCurrentReadingBookUseCase.execute(userId: userId, book: book);
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;
}
