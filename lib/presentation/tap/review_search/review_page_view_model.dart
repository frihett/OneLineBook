import 'package:flutter/cupertino.dart';
import 'package:untitled9/domain/use_case/delete_review_to_user_use_case.dart';

import '../../../domain/model/review.dart';
import '../../../domain/use_case/edit_review_use_case.dart';

class ReviewPageViewModel with ChangeNotifier {
  final DeleteReviewToUserUseCase _deleteReviewToUserUseCase;
  final EditReviewUseCase _editReviewUseCase;

  ReviewPageViewModel({
    required EditReviewUseCase editReviewUseCase,
    required DeleteReviewToUserUseCase deleteReviewToUserUseCase,
  })  : _deleteReviewToUserUseCase = deleteReviewToUserUseCase,
        _editReviewUseCase = editReviewUseCase;

  Future<void> deleteReview(
      {required String userId, required Review review}) async {
    await _deleteReviewToUserUseCase.execute(userId: userId, review: review);
  }

  Future<void> editReview(
      {required String userId,
      required String reviewContent,
      required Review review}) async {
    await _editReviewUseCase.execute(
        userId: userId, reviewContent: reviewContent, review: review);
  }
}
