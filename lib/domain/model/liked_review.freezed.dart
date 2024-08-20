// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'liked_review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LikedReview _$LikedReviewFromJson(Map<String, dynamic> json) {
  return _LikedReview.fromJson(json);
}

/// @nodoc
mixin _$LikedReview {
  String get likedReviewId => throw _privateConstructorUsedError;
  String get reviewId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LikedReviewCopyWith<LikedReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikedReviewCopyWith<$Res> {
  factory $LikedReviewCopyWith(
          LikedReview value, $Res Function(LikedReview) then) =
      _$LikedReviewCopyWithImpl<$Res, LikedReview>;
  @useResult
  $Res call(
      {String likedReviewId, String reviewId, String userId, String createdAt});
}

/// @nodoc
class _$LikedReviewCopyWithImpl<$Res, $Val extends LikedReview>
    implements $LikedReviewCopyWith<$Res> {
  _$LikedReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? likedReviewId = null,
    Object? reviewId = null,
    Object? userId = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      likedReviewId: null == likedReviewId
          ? _value.likedReviewId
          : likedReviewId // ignore: cast_nullable_to_non_nullable
              as String,
      reviewId: null == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LikedReviewImplCopyWith<$Res>
    implements $LikedReviewCopyWith<$Res> {
  factory _$$LikedReviewImplCopyWith(
          _$LikedReviewImpl value, $Res Function(_$LikedReviewImpl) then) =
      __$$LikedReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String likedReviewId, String reviewId, String userId, String createdAt});
}

/// @nodoc
class __$$LikedReviewImplCopyWithImpl<$Res>
    extends _$LikedReviewCopyWithImpl<$Res, _$LikedReviewImpl>
    implements _$$LikedReviewImplCopyWith<$Res> {
  __$$LikedReviewImplCopyWithImpl(
      _$LikedReviewImpl _value, $Res Function(_$LikedReviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? likedReviewId = null,
    Object? reviewId = null,
    Object? userId = null,
    Object? createdAt = null,
  }) {
    return _then(_$LikedReviewImpl(
      likedReviewId: null == likedReviewId
          ? _value.likedReviewId
          : likedReviewId // ignore: cast_nullable_to_non_nullable
              as String,
      reviewId: null == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LikedReviewImpl implements _LikedReview {
  const _$LikedReviewImpl(
      {required this.likedReviewId,
      required this.reviewId,
      required this.userId,
      required this.createdAt});

  factory _$LikedReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$LikedReviewImplFromJson(json);

  @override
  final String likedReviewId;
  @override
  final String reviewId;
  @override
  final String userId;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'LikedReview(likedReviewId: $likedReviewId, reviewId: $reviewId, userId: $userId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikedReviewImpl &&
            (identical(other.likedReviewId, likedReviewId) ||
                other.likedReviewId == likedReviewId) &&
            (identical(other.reviewId, reviewId) ||
                other.reviewId == reviewId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, likedReviewId, reviewId, userId, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LikedReviewImplCopyWith<_$LikedReviewImpl> get copyWith =>
      __$$LikedReviewImplCopyWithImpl<_$LikedReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LikedReviewImplToJson(
      this,
    );
  }
}

abstract class _LikedReview implements LikedReview {
  const factory _LikedReview(
      {required final String likedReviewId,
      required final String reviewId,
      required final String userId,
      required final String createdAt}) = _$LikedReviewImpl;

  factory _LikedReview.fromJson(Map<String, dynamic> json) =
      _$LikedReviewImpl.fromJson;

  @override
  String get likedReviewId;
  @override
  String get reviewId;
  @override
  String get userId;
  @override
  String get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$LikedReviewImplCopyWith<_$LikedReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
