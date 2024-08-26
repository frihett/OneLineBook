import 'package:flutter/material.dart';

import '../../../domain/model/book.dart';
import '../../../domain/use_case/add_current_reading_book_use_case.dart';

class BookDetailPageViewModel with ChangeNotifier {
  final AddCurrentReadingBookUseCase _addCurrentReadingBookUseCase;

  BookDetailPageViewModel({
    required AddCurrentReadingBookUseCase addCurrentReadingBookUseCase,
  }) : _addCurrentReadingBookUseCase = addCurrentReadingBookUseCase;

  Future<void> addCurrentReadingBookList(
      {required String userId, required Book book}) async {
    await _addCurrentReadingBookUseCase.execute(userId: userId, book: book);
  }
}
