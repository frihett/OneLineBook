import 'package:untitled9/domain/repository/review_repository.dart';

import '../model/review.dart';

class GetReviewUseCase {
  final ReviewRepository _reviewRepository;

  const GetReviewUseCase({
    required ReviewRepository reviewRepository,
  }) : _reviewRepository = reviewRepository;

  Future<Review?> execute({required String reviewId}) async {
    return await _reviewRepository.getReview(reviewId: reviewId);
  }
}
