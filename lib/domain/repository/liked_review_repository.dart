import '../model/liked_review.dart';

abstract interface class LikedReviewRepository {
  Future<void> createLikedReview({required LikedReview likedReview});

  Future<LikedReview?> getLikedReview({required String likedReviewId});

  Future<void> updateLikedReview({required LikedReview likedReview});

  Future<void> deleteLikedReview({required String likedReviewId});
}
