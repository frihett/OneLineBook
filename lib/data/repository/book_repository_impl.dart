import 'package:untitled9/domain/repository/book_repository.dart';

import '../../domain/model/book.dart';
import '../data_source/book_api.dart';

class BookRepositoryImpl implements BookRepository {
  final BookApi _api = BookApi();

  @override
  Future<List<Book>> getBookList(String query) {
    return _api.getBook(query);
  }
}
