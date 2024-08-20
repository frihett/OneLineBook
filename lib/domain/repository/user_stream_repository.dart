import '../model/book.dart';
import '../model/user.dart';

abstract interface class UserStreamRepository {
  Stream<User?> getUserStream({required String userId});

  Stream<List<Book>> getCurrentReadingBookList({required String userId});
}