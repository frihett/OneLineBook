import 'package:untitled9/domain/repository/review_repository.dart';

import '../model/review.dart';

class ToggleLikeReviewUseCase {
  final ReviewRepository _reviewRepository;

  const ToggleLikeReviewUseCase({
    required ReviewRepository reviewRepository,
  }) : _reviewRepository = reviewRepository;

  Future<void> execute({required Review review, required String userId}) async {
    await _reviewRepository.toggleLikeReview(review: review, userId: userId);
  }
}
