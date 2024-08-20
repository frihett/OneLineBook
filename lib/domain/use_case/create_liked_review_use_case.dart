import 'package:untitled9/domain/model/liked_review.dart';
import 'package:untitled9/domain/repository/liked_review_repository.dart';

class CreateLikedReviewUseCase {
  final LikedReviewRepository _likedReviewRepository;

  const CreateLikedReviewUseCase({
    required LikedReviewRepository likedReviewRepository,
  }) : _likedReviewRepository = likedReviewRepository;

  Future<void> execute({required LikedReview likedReview}) async {
    await _likedReviewRepository.createLikedReview(likedReview: likedReview);
  }
}
