import 'package:flutter/widgets.dart';
import 'package:untitled9/domain/use_case/get_user_use_case.dart';
import 'package:untitled9/domain/use_case/toggle_like_review_use_case.dart';

import '../../../domain/model/review.dart';
import '../../../domain/model/user.dart';

class RakingPageViewModel with ChangeNotifier {
  final ToggleLikeReviewUseCase _toggleLikeReviewUseCase;
  final GetUserUseCase _getUserUseCase;

  RakingPageViewModel({
    required GetUserUseCase getUserUseCase,
    required ToggleLikeReviewUseCase toggleLikeReviewUseCase,
  })  : _toggleLikeReviewUseCase = toggleLikeReviewUseCase,
        _getUserUseCase = getUserUseCase;

  Future<void> toggleLikeReview(
      {required Review review, required String userId}) async {
    await _toggleLikeReviewUseCase.execute(review: review, userId: userId);
  }

  Future<User?> getUser({required String userId}) async {
    return  _getUserUseCase.execute(userId: userId);
  }
}
