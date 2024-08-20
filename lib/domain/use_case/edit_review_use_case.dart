import 'package:untitled9/domain/repository/review_repository.dart';
import 'package:untitled9/domain/repository/user_repository.dart';

import '../model/review.dart';

class EditReviewUseCase {
  final UserRepository _userRepository;
  final ReviewRepository _reviewRepository;

  const EditReviewUseCase({
    required UserRepository userRepository,
    required ReviewRepository reviewRepository,
  })  : _userRepository = userRepository,
        _reviewRepository = reviewRepository;

  Future<void> execute(
      {required String userId,
      required String reviewContent,
      required Review review}) async {
    // 1. 리뷰 객체 고치기
    await _reviewRepository.editReview(review: review, reviewContent: reviewContent);

    // 2. 유저 안에 리뷰 객체 고치기
    await _userRepository.updateUsersReview(
        userId: userId, reviewContent: reviewContent, review: review);

    print('edit Review 성공 ');
  }
}
