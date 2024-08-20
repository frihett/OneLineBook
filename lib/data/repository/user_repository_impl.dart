import 'package:untitled9/data/data_source/user_data_source.dart';

import '../../domain/model/book.dart';
import '../../domain/model/review.dart';
import '../../domain/model/user.dart';
import '../../domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl({required UserDataSource userDataSource})
      : _userDataSource = userDataSource;

  Future<void> createUser({required User user}) async {
    try {
      await _userDataSource.createUser(user: user);
    } catch (e) {
      throw Exception('fail : $e');
    }
  }

  Future<User?> getUser({required String userId}) async {
    try {
      return await _userDataSource.getUser(userId: userId);
    } catch (e) {
      throw Exception('fail : $e');
    }
  }

  Future<void> updateUser({required User user}) async {
    try {
      await _userDataSource.updateUser(user: user);
    } catch (e) {
      throw Exception('fail : $e');
    }
  }

  Future<void> deleteUser({required String userId}) async {
    try {
      await _userDataSource.deleteUser(userId: userId);
    } catch (e) {
      throw Exception('fail : $e');
    }
  }

  Future<void> addReviewToUser(
      {required String userId, required Review review}) async {
    try {
      await _userDataSource.addReviewToUser(userId: userId, review: review);
    } catch (e) {
      throw Exception('addReviewToUser fail : $e');
    }
  }

  Future<void> deleteReviewToUser(
      {required String userId, required Review review}) async {
    try {
      await _userDataSource.deleteReviewToUser(userId: userId, review: review);
    } catch (e) {
      throw Exception('addReviewToUser fail : $e');
    }
  }

  Future<void> addCurrentReadingBookToUser(
      {required String userId, required Book book}) async {
    try {
      await _userDataSource.addCurrentReadingBookToUser(
          userId: userId, book: book);
    } catch (e) {
      throw Exception('addCurrentReadingBookToUser fail : $e');
    }
  }

  Future<void> deleteCurrentReadingBookToUser(
      {required String userId, required Book book}) async {
    try {
      await _userDataSource.deleteCurrentReadingBookToUser(
          userId: userId, book: book);
    } catch (e) {
      throw Exception('deleteCurrentReadingBookToUser fail : $e');
    }
  }

  Future<void> updateUsersReview(
      {required String userId,
      required String reviewContent,
      required Review review}) async {
    await _userDataSource.updateUsersReview(
        userId: userId, reviewContent: reviewContent, review: review);
  }
}
