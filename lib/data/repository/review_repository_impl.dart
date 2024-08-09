import 'package:untitled9/data/data_source/review_data_source.dart';

import '../../domain/model/review.dart';

class ReviewRepositoryImpl {
  final ReviewDataSource _reviewDataSource;

  const ReviewRepositoryImpl({
    required ReviewDataSource reviewDataSource,
  }) : _reviewDataSource = reviewDataSource;

  Future<void> createReview({required Review review}) async {
    try {
      await _reviewDataSource.createReview(review: review);
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

  Future<void> updateReview({required Review review}) async {
    try {
      await _reviewDataSource.updateReview(review: review);
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
}
