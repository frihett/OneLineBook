import '../model/book.dart';

abstract interface class BookRepository {
  Future<List<Book>> getBookList(String query);
}
