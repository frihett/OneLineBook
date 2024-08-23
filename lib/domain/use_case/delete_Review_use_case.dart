import 'package:untitled9/domain/repository/review_repository.dart';

class DeleteReviewUseCase {
  final ReviewRepository _reviewRepository;

  const DeleteReviewUseCase({
    required ReviewRepository reviewRepository,
  }) : _reviewRepository = reviewRepository;

  Future<void> execute({required String reviewId}) async {
    try {
      await _reviewRepository.deleteReview(reviewId: reviewId);
    } catch (e) {
      throw Exception('deleteReviewUseCase fail : $e');
    }
  }
}
