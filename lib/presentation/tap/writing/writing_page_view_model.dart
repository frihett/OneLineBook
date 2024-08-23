import 'package:flutter/cupertino.dart';
import 'package:untitled9/domain/model/review.dart';
import 'package:untitled9/domain/use_case/add_users_review_use_case.dart';
import 'package:untitled9/domain/use_case/create_review_use_case.dart';

import '../../../domain/model/book.dart';
import '../../../domain/use_case/get_review_use_case.dart';

class WritingPageViewModel with ChangeNotifier {
  Book? _selectedBook;
  final CreateReviewUseCase _createReviewUseCase;
  final AddUsersReviewUseCase _addUsersReviewUseCase;
  final GetReviewUseCase _getReviewUseCase;

  WritingPageViewModel({
    required GetReviewUseCase getReviewUseCase,
    required AddUsersReviewUseCase addUsersReviewUseCase,
    required CreateReviewUseCase createReviewUseCase,
  })  : _createReviewUseCase = createReviewUseCase,
        _addUsersReviewUseCase = addUsersReviewUseCase,
        _getReviewUseCase = getReviewUseCase;

  Book? get selectedBook => _selectedBook;

  void setSelectedBook(Book? book) {
    _selectedBook = book;
    notifyListeners();
  }

  // 파이어스토어에 리뷰 추가, 유저에 리뷰리스트에 추가
  Future<void> uploadReview(
      {required Book book,
      required String content,
      required String userId}) async {
    final review = Review(
      
      bookId: book.isbn,
      book: book,
      content: content,
      createdAt: DateTime.now().microsecondsSinceEpoch.toString(),
      userId: userId, likes: 0,
    );
    try {
      // 리뷰 생성
      final updatedReview = await _createReviewUseCase.execute(review: review);
      // 유저에 리뷰 생성
      await _addUsersReviewUseCase.execute(
          userId: userId, review: updatedReview!);
    } catch (e) {
      print('Error uploading review: $e');
    }
  }
}
