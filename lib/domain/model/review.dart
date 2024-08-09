import 'package:freezed_annotation/freezed_annotation.dart';

part 'review.freezed.dart';

part 'review.g.dart';

@freezed
class Review with _$Review {
  factory Review(
      {required String reviewId,
      required String userId,
      required String bookId,
      required String bookTitle,
      required String review,
      required String description,
      required String bookImageUrl,
      required String createdAt,
        String? updatedAt}) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}
