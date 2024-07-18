import 'package:untitled9/repository/book_repository.dart';
import '../data_source/book_api.dart';
import '../model/book.dart';

class BookRepositoryImpl implements BookRepository {
  final BookApi _api = BookApi();

  @override
  Future<List<Book>> getBookList(String query) {
    return _api.getBook(query);
  }
}
