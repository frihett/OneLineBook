import 'package:flutter/cupertino.dart';
import 'package:untitled9/domain/repository/book_repository.dart';
import 'package:untitled9/domain/use_case/add_current_reading_book_use_case.dart';

import '../../../domain/model/book.dart';

class SearchPageViewModel with ChangeNotifier {
  final BookRepository _bookRepository;
  final AddCurrentReadingBookUseCase _addCurrentReadingBookUseCase;

  SearchPageViewModel({
    required AddCurrentReadingBookUseCase addCurrentReadingBookUseCase,
    required BookRepository bookRepository,
  })  : _bookRepository = bookRepository,
        _addCurrentReadingBookUseCase = addCurrentReadingBookUseCase;

  List<Book> _book = [];

  List<Book> get book => List.unmodifiable(_book);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void fetchBook(String query) async {
    _isLoading = true;
    notifyListeners();
    try {
      _book = await _bookRepository.getBookList(query: query);
    } catch (e) {
      print('Error fetching books: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addCurrentReadingBookList(
      {required String userId, required Book book}) async {
   await  _addCurrentReadingBookUseCase.execute(userId: userId, book: book);
  }
}
