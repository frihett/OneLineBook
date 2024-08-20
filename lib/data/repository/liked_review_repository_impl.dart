import 'package:untitled9/data/data_source/liked_review_data_source.dart';
import 'package:untitled9/domain/model/liked_review.dart';

import '../../domain/repository/liked_review_repository.dart';

class LikedReviewRepositoryImpl implements LikedReviewRepository{
  final LikedReviewDataSource _likedReviewDataSource;

  const LikedReviewRepositoryImpl({
    required LikedReviewDataSource likedReviewDataSource,
  }) : _likedReviewDataSource = likedReviewDataSource;

  Future<void> createLikedReview({required LikedReview likedReview}) async {
    try {
      await _likedReviewDataSource.createLikedReview(likedReview: likedReview);
    } catch (e) {
      throw Exception('fail : $e');
    }
  }

  Future<LikedReview?> getLikedReview({required String likedReviewId}) async {
    try {
      return await _likedReviewDataSource.getLikedReview(
          likedReviewId: likedReviewId);
    } catch (e) {
      throw Exception('fail : $e');
    }
  }

  Future<void> updateLikedReview({required LikedReview likedReview}) async {
    try {
      await _likedReviewDataSource.updateLikedReview(likedReview: likedReview);
    } catch (e) {
      throw Exception('fail : $e');
    }
  }

  Future<void> deleteLikedReview({required String likedReviewId}) async {
    try {
      await _likedReviewDataSource.deleteLikedReview(
          likedReviewId: likedReviewId);
    } catch (e) {
      throw Exception('fail : $e');
    }
  }
}
