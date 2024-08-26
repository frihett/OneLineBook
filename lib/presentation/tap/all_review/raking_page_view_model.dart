import 'package:flutter/widgets.dart';
import 'package:untitled9/domain/use_case/toggle_like_review_use_case.dart';

import '../../../domain/model/review.dart';

class RakingPageViewModel with ChangeNotifier {
  final ToggleLikeReviewUseCase _toggleLikeReviewUseCase;

  RakingPageViewModel({
    required ToggleLikeReviewUseCase toggleLikeReviewUseCase,
  }) : _toggleLikeReviewUseCase = toggleLikeReviewUseCase;

  Future<void> toggleLikeReview(
      {required Review review, required String userId}) async {
    await _toggleLikeReviewUseCase.execute(review: review, userId: userId);
  }
}
