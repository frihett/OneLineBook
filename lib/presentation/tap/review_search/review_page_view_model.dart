import 'package:flutter/cupertino.dart';
import 'package:untitled9/domain/use_case/delete_Review_use_case.dart';
import 'package:untitled9/domain/use_case/delete_review_to_user_use_case.dart';

import '../../../domain/model/review.dart';
import '../../../domain/use_case/edit_review_use_case.dart';

class ReviewPageViewModel with ChangeNotifier {
  final DeleteReviewToUserUseCase _deleteReviewToUserUseCase;
  final EditReviewUseCase _editReviewUseCase;
  final DeleteReviewUseCase _deleteReviewUseCase;

  ReviewPageViewModel({
    required DeleteReviewUseCase deleteReviewUseCase,
    required EditReviewUseCase editReviewUseCase,
    required DeleteReviewToUserUseCase deleteReviewToUserUseCase,
  })  : _deleteReviewUseCase = deleteReviewUseCase,
        _deleteReviewToUserUseCase = deleteReviewToUserUseCase,
        _editReviewUseCase = editReviewUseCase;

  Future<void> deleteReview(
      {required String userId, required Review review}) async {
    // 유저의 리뷰리스트에서 삭제
    await _deleteReviewToUserUseCase.execute(userId: userId, review: review);
    // 리뷰컬렉션에서 삭제
    if (review.reviewId != null) {
      await _deleteReviewUseCase.execute(reviewId: review.reviewId!);
    }
  }

  Future<void> editReview(
      {required String userId,
      required String reviewContent,
      required Review review}) async {
    await _editReviewUseCase.execute(
        userId: userId, reviewContent: reviewContent, review: review);
  }
}
