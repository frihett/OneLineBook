import 'package:untitled9/data/data_source/review_data_source.dart';

import '../../domain/model/review.dart';
import '../../domain/repository/review_repository.dart';

class ReviewRepositoryImpl implements ReviewRepository {
  final ReviewDataSource _reviewDataSource;

  const ReviewRepositoryImpl({
    required ReviewDataSource reviewDataSource,
  }) : _reviewDataSource = reviewDataSource;

  Future<Review?> createReview({required Review review}) async {
    try {
      return await _reviewDataSource.createReview(review: review);
    } catch (e) {
      throw Exception('fail : $e');
    }
  }

  Future<Review?> getReview({required String reviewId}) async {
    try {
      return await _reviewDataSource.getReview(reviewId: reviewId);
    } catch (e) {
      throw Exception('fail : $e');
    }
  }

  Future<void> deleteReview({required String reviewId}) async {
    try {
      await _reviewDataSource.deleteReview(reviewId: reviewId);
    } catch (e) {
      throw Exception('fail : $e');
    }
  }

  Future<void> editReview(
      {required Review review, required String reviewContent}) async {
    try {
      await _reviewDataSource.editReview(
          review: review, reviewContent: reviewContent);
    } catch (e) {
      throw Exception('review Repository editReview fail : $e');
    }
  }

  Future<void> toggleLikeReview(
      {required Review review, required String userId}) async {
    try {
      await _reviewDataSource.toggleLikeReview(review: review, userId: userId);
    } catch (e) {
      throw Exception('review Repository toggleLikeReview fail : $e');
    }
  }
}
