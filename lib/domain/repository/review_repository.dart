import '../model/review.dart';

abstract interface class ReviewRepository {
  Future<void> createReview({required Review review});

  Future<Review?> getReview({required String reviewId});

  Future<void> updateReview({required Review review});

  Future<void> deleteReview({required String reviewId});
}
