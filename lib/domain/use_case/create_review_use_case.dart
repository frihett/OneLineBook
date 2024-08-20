import 'package:untitled9/domain/repository/review_repository.dart';

import '../model/review.dart';

class CreateReviewUseCase {
  final ReviewRepository _reviewRepository;

  const CreateReviewUseCase({
    required ReviewRepository reviewRepository,
  }) : _reviewRepository = reviewRepository;

  Future<Review?> execute({required Review review}) async {
    try {
      return await _reviewRepository.createReview(review: review);
    } catch (e) {
      print('Error in excute: $e');
    }
  }
}
