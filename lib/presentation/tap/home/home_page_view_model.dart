import 'package:flutter/cupertino.dart';

import '../../../domain/model/book.dart';
import '../../../domain/model/review.dart';
import '../../../domain/model/user.dart';
import '../../../domain/repository/user_stream_repository.dart';
import '../../../domain/use_case/delete_Review_use_case.dart';
import '../../../domain/use_case/delete_current_reading_book_use_case.dart';
import '../../../domain/use_case/delete_review_to_user_use_case.dart';
import '../../../domain/use_case/edit_review_use_case.dart';

class HomePageViewModel with ChangeNotifier {
  final UserStreamRepository _userStreamRepository;
  final DeleteCurrentReadingBookUseCase _deleteCurrentReadingBookUseCase;
  final DeleteReviewToUserUseCase _deleteReviewToUserUseCase;
  final EditReviewUseCase _editReviewUseCase;
  final DeleteReviewUseCase _deleteReviewUseCase;

  HomePageViewModel({
    required UserStreamRepository userStreamRepository,
    required DeleteCurrentReadingBookUseCase deleteCurrentReadingBookUseCase,
    required DeleteReviewToUserUseCase deleteReviewToUserUseCase,
    required EditReviewUseCase editReviewUseCase,
    required DeleteReviewUseCase deleteReviewUseCase,
  })  : _userStreamRepository = userStreamRepository,
        _deleteCurrentReadingBookUseCase = deleteCurrentReadingBookUseCase,
        _deleteReviewToUserUseCase = deleteReviewToUserUseCase,
        _editReviewUseCase = editReviewUseCase,
        _deleteReviewUseCase = deleteReviewUseCase;

  Stream<User?> getUserStream({required String userId}) {
    return _userStreamRepository.getUserStream(userId: userId);
  }

  Future<void> deleteCurrentReadingBook(
      {required String userId, required Book book}) async {
    await _deleteCurrentReadingBookUseCase.execute(userId: userId, book: book);
  }

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

  bool _isLoading = false;

  bool get isLoading => _isLoading;
}
