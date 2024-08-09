import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'liked_review.freezed.dart';

part 'liked_review.g.dart';

@freezed
class LikedReview with _$LikedReview {
  const factory LikedReview({
    required String likedReviewId,
    required String reviewId,
    required String userId,
    required String createdAt,
  }) = _LikedReview;

  factory LikedReview.fromJson(Map<String, Object?> json) => _$LikedReviewFromJson(json);
}