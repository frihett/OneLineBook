import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:untitled9/domain/model/review.dart';

import 'book.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String? userId,
    required String userName,
    required String email,
    required String profilePictureUrl,
    List<Book>? currentReadingBookList,
    List<Review>? likedReviewList,
    List<Review>? reviewList,
    required String createAt,
    String? updateAt,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
