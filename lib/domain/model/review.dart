import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:untitled9/domain/model/book.dart';

part 'review.freezed.dart';

part 'review.g.dart';

@freezed
class Review with _$Review {
  factory Review(
      {String? reviewId,
      required String userId,
      required String bookId,
      required Book book,
      required String content,
      required String createdAt,
      required int likes,
      List<String>? likedByUserId,
      String? updatedAt}) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}
