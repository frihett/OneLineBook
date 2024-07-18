// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Book _$BookFromJson(Map<String, dynamic> json) {
  return _Book.fromJson(json);
}

/// @nodoc
mixin _$Book {
  List<String> get authors => throw _privateConstructorUsedError;
  String get contents => throw _privateConstructorUsedError;
  DateTime get datetime => throw _privateConstructorUsedError;
  String get isbn => throw _privateConstructorUsedError;
  String get publisher => throw _privateConstructorUsedError;
  String get thumbnail => throw _privateConstructorUsedError;
  List<String> get translators => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookCopyWith<Book> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookCopyWith<$Res> {
  factory $BookCopyWith(Book value, $Res Function(Book) then) =
      _$BookCopyWithImpl<$Res, Book>;
  @useResult
  $Res call(
      {List<String> authors,
      String contents,
      DateTime datetime,
      String isbn,
      String publisher,
      String thumbnail,
      List<String> translators});
}

/// @nodoc
class _$BookCopyWithImpl<$Res, $Val extends Book>
    implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authors = null,
    Object? contents = null,
    Object? datetime = null,
    Object? isbn = null,
    Object? publisher = null,
    Object? thumbnail = null,
    Object? translators = null,
  }) {
    return _then(_value.copyWith(
      authors: null == authors
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isbn: null == isbn
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String,
      publisher: null == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      translators: null == translators
          ? _value.translators
          : translators // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookImplCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$$BookImplCopyWith(
          _$BookImpl value, $Res Function(_$BookImpl) then) =
      __$$BookImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> authors,
      String contents,
      DateTime datetime,
      String isbn,
      String publisher,
      String thumbnail,
      List<String> translators});
}

/// @nodoc
class __$$BookImplCopyWithImpl<$Res>
    extends _$BookCopyWithImpl<$Res, _$BookImpl>
    implements _$$BookImplCopyWith<$Res> {
  __$$BookImplCopyWithImpl(_$BookImpl _value, $Res Function(_$BookImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authors = null,
    Object? contents = null,
    Object? datetime = null,
    Object? isbn = null,
    Object? publisher = null,
    Object? thumbnail = null,
    Object? translators = null,
  }) {
    return _then(_$BookImpl(
      authors: null == authors
          ? _value._authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isbn: null == isbn
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String,
      publisher: null == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      translators: null == translators
          ? _value._translators
          : translators // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookImpl with DiagnosticableTreeMixin implements _Book {
  const _$BookImpl(
      {required final List<String> authors,
      required this.contents,
      required this.datetime,
      required this.isbn,
      required this.publisher,
      required this.thumbnail,
      required final List<String> translators})
      : _authors = authors,
        _translators = translators;

  factory _$BookImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookImplFromJson(json);

  final List<String> _authors;
  @override
  List<String> get authors {
    if (_authors is EqualUnmodifiableListView) return _authors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_authors);
  }

  @override
  final String contents;
  @override
  final DateTime datetime;
  @override
  final String isbn;
  @override
  final String publisher;
  @override
  final String thumbnail;
  final List<String> _translators;
  @override
  List<String> get translators {
    if (_translators is EqualUnmodifiableListView) return _translators;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_translators);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Book(authors: $authors, contents: $contents, datetime: $datetime, isbn: $isbn, publisher: $publisher, thumbnail: $thumbnail, translators: $translators)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Book'))
      ..add(DiagnosticsProperty('authors', authors))
      ..add(DiagnosticsProperty('contents', contents))
      ..add(DiagnosticsProperty('datetime', datetime))
      ..add(DiagnosticsProperty('isbn', isbn))
      ..add(DiagnosticsProperty('publisher', publisher))
      ..add(DiagnosticsProperty('thumbnail', thumbnail))
      ..add(DiagnosticsProperty('translators', translators));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookImpl &&
            const DeepCollectionEquality().equals(other._authors, _authors) &&
            (identical(other.contents, contents) ||
                other.contents == contents) &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime) &&
            (identical(other.isbn, isbn) || other.isbn == isbn) &&
            (identical(other.publisher, publisher) ||
                other.publisher == publisher) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            const DeepCollectionEquality()
                .equals(other._translators, _translators));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_authors),
      contents,
      datetime,
      isbn,
      publisher,
      thumbnail,
      const DeepCollectionEquality().hash(_translators));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookImplCopyWith<_$BookImpl> get copyWith =>
      __$$BookImplCopyWithImpl<_$BookImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookImplToJson(
      this,
    );
  }
}

abstract class _Book implements Book {
  const factory _Book(
      {required final List<String> authors,
      required final String contents,
      required final DateTime datetime,
      required final String isbn,
      required final String publisher,
      required final String thumbnail,
      required final List<String> translators}) = _$BookImpl;

  factory _Book.fromJson(Map<String, dynamic> json) = _$BookImpl.fromJson;

  @override
  List<String> get authors;
  @override
  String get contents;
  @override
  DateTime get datetime;
  @override
  String get isbn;
  @override
  String get publisher;
  @override
  String get thumbnail;
  @override
  List<String> get translators;
  @override
  @JsonKey(ignore: true)
  _$$BookImplCopyWith<_$BookImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
