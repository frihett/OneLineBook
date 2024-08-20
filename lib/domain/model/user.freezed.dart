// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String? get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get profilePictureUrl => throw _privateConstructorUsedError;
  List<Book>? get currentReadingBookList => throw _privateConstructorUsedError;
  List<Review>? get likedReviewList => throw _privateConstructorUsedError;
  List<Review>? get reviewList => throw _privateConstructorUsedError;
  String get createAt => throw _privateConstructorUsedError;
  String? get updateAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String? userId,
      String userName,
      String email,
      String profilePictureUrl,
      List<Book>? currentReadingBookList,
      List<Review>? likedReviewList,
      List<Review>? reviewList,
      String createAt,
      String? updateAt});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? userName = null,
    Object? email = null,
    Object? profilePictureUrl = null,
    Object? currentReadingBookList = freezed,
    Object? likedReviewList = freezed,
    Object? reviewList = freezed,
    Object? createAt = null,
    Object? updateAt = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      profilePictureUrl: null == profilePictureUrl
          ? _value.profilePictureUrl
          : profilePictureUrl // ignore: cast_nullable_to_non_nullable
              as String,
      currentReadingBookList: freezed == currentReadingBookList
          ? _value.currentReadingBookList
          : currentReadingBookList // ignore: cast_nullable_to_non_nullable
              as List<Book>?,
      likedReviewList: freezed == likedReviewList
          ? _value.likedReviewList
          : likedReviewList // ignore: cast_nullable_to_non_nullable
              as List<Review>?,
      reviewList: freezed == reviewList
          ? _value.reviewList
          : reviewList // ignore: cast_nullable_to_non_nullable
              as List<Review>?,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as String,
      updateAt: freezed == updateAt
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? userId,
      String userName,
      String email,
      String profilePictureUrl,
      List<Book>? currentReadingBookList,
      List<Review>? likedReviewList,
      List<Review>? reviewList,
      String createAt,
      String? updateAt});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? userName = null,
    Object? email = null,
    Object? profilePictureUrl = null,
    Object? currentReadingBookList = freezed,
    Object? likedReviewList = freezed,
    Object? reviewList = freezed,
    Object? createAt = null,
    Object? updateAt = freezed,
  }) {
    return _then(_$UserImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      profilePictureUrl: null == profilePictureUrl
          ? _value.profilePictureUrl
          : profilePictureUrl // ignore: cast_nullable_to_non_nullable
              as String,
      currentReadingBookList: freezed == currentReadingBookList
          ? _value._currentReadingBookList
          : currentReadingBookList // ignore: cast_nullable_to_non_nullable
              as List<Book>?,
      likedReviewList: freezed == likedReviewList
          ? _value._likedReviewList
          : likedReviewList // ignore: cast_nullable_to_non_nullable
              as List<Review>?,
      reviewList: freezed == reviewList
          ? _value._reviewList
          : reviewList // ignore: cast_nullable_to_non_nullable
              as List<Review>?,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as String,
      updateAt: freezed == updateAt
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {required this.userId,
      required this.userName,
      required this.email,
      required this.profilePictureUrl,
      final List<Book>? currentReadingBookList,
      final List<Review>? likedReviewList,
      final List<Review>? reviewList,
      required this.createAt,
      this.updateAt})
      : _currentReadingBookList = currentReadingBookList,
        _likedReviewList = likedReviewList,
        _reviewList = reviewList;

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String? userId;
  @override
  final String userName;
  @override
  final String email;
  @override
  final String profilePictureUrl;
  final List<Book>? _currentReadingBookList;
  @override
  List<Book>? get currentReadingBookList {
    final value = _currentReadingBookList;
    if (value == null) return null;
    if (_currentReadingBookList is EqualUnmodifiableListView)
      return _currentReadingBookList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Review>? _likedReviewList;
  @override
  List<Review>? get likedReviewList {
    final value = _likedReviewList;
    if (value == null) return null;
    if (_likedReviewList is EqualUnmodifiableListView) return _likedReviewList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Review>? _reviewList;
  @override
  List<Review>? get reviewList {
    final value = _reviewList;
    if (value == null) return null;
    if (_reviewList is EqualUnmodifiableListView) return _reviewList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String createAt;
  @override
  final String? updateAt;

  @override
  String toString() {
    return 'User(userId: $userId, userName: $userName, email: $email, profilePictureUrl: $profilePictureUrl, currentReadingBookList: $currentReadingBookList, likedReviewList: $likedReviewList, reviewList: $reviewList, createAt: $createAt, updateAt: $updateAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.profilePictureUrl, profilePictureUrl) ||
                other.profilePictureUrl == profilePictureUrl) &&
            const DeepCollectionEquality().equals(
                other._currentReadingBookList, _currentReadingBookList) &&
            const DeepCollectionEquality()
                .equals(other._likedReviewList, _likedReviewList) &&
            const DeepCollectionEquality()
                .equals(other._reviewList, _reviewList) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      userName,
      email,
      profilePictureUrl,
      const DeepCollectionEquality().hash(_currentReadingBookList),
      const DeepCollectionEquality().hash(_likedReviewList),
      const DeepCollectionEquality().hash(_reviewList),
      createAt,
      updateAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final String? userId,
      required final String userName,
      required final String email,
      required final String profilePictureUrl,
      final List<Book>? currentReadingBookList,
      final List<Review>? likedReviewList,
      final List<Review>? reviewList,
      required final String createAt,
      final String? updateAt}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String? get userId;
  @override
  String get userName;
  @override
  String get email;
  @override
  String get profilePictureUrl;
  @override
  List<Book>? get currentReadingBookList;
  @override
  List<Review>? get likedReviewList;
  @override
  List<Review>? get reviewList;
  @override
  String get createAt;
  @override
  String? get updateAt;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
