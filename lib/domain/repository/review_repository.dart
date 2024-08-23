import '../model/review.dart';

abstract interface class ReviewRepository {
  Future<Review?> createReview({required Review review});

  Future<Review?> getReview({required String reviewId});


  Future<void> deleteReview({required String reviewId});

  Future<void> editReview(
      {required Review review, required String reviewContent});

  Future<void> toggleLikeReview({required Review review,required String userId});
}

