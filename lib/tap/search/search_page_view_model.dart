import 'package:flutter/cupertino.dart';
import 'package:untitled9/repository/book_repository.dart';

import '../../model/book.dart';

class SearchPageViewModel with ChangeNotifier {
  final BookRepository _bookRepository;

  SearchPageViewModel({
    required BookRepository bookRepository,
  }) : _bookRepository = bookRepository;

  List<Book> _book = [];

  List<Book> get book => List.unmodifiable(_book);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void fetchBook(String query) async {
    _isLoading = true;
    notifyListeners();
    try {
      _book = await _bookRepository.getBookList(query);
    } catch (e) {
      print('Error fetching books: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
