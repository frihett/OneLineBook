import '../model/book.dart';
import '../model/review.dart';
import '../model/user.dart';

abstract interface class UserRepository {
  Future<void> createUser({required User user});

  Future<User?> getUser({required String userId});

  Future<void> updateUser({required User user});

  Future<void> deleteUser({required String userId});

  Future<void> addReviewToUser(
      {required String userId, required Review review});

  Future<void> deleteReviewToUser(
      {required String userId, required Review review});

  Future<void> addCurrentReadingBookToUser(
      {required String userId, required Book book});

  Future<void> deleteCurrentReadingBookToUser(
      {required String userId, required Book book});

  Future<void> updateUsersReview({required String userId,
    required String reviewContent,
    required Review review});
}
