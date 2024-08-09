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
  String get title => throw _privateConstructorUsedError;
  List<String> get authors => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get isbn => throw _privateConstructorUsedError;
  String get publisher => throw _privateConstructorUsedError;
  String get bookImageUrl => throw _privateConstructorUsedError;
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
      {String title,
      List<String> authors,
      String description,
      String isbn,
      String publisher,
      String bookImageUrl,
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
    Object? title = null,
    Object? authors = null,
    Object? description = null,
    Object? isbn = null,
    Object? publisher = null,
    Object? bookImageUrl = null,
    Object? translators = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      authors: null == authors
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isbn: null == isbn
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String,
      publisher: null == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String,
      bookImageUrl: null == bookImageUrl
          ? _value.bookImageUrl
          : bookImageUrl // ignore: cast_nullable_to_non_nullable
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
      {String title,
      List<String> authors,
      String description,
      String isbn,
      String publisher,
      String bookImageUrl,
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
    Object? title = null,
    Object? authors = null,
    Object? description = null,
    Object? isbn = null,
    Object? publisher = null,
    Object? bookImageUrl = null,
    Object? translators = null,
  }) {
    return _then(_$BookImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      authors: null == authors
          ? _value._authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isbn: null == isbn
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String,
      publisher: null == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String,
      bookImageUrl: null == bookImageUrl
          ? _value.bookImageUrl
          : bookImageUrl // ignore: cast_nullable_to_non_nullable
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
      {required this.title,
      required final List<String> authors,
      required this.description,
      required this.isbn,
      required this.publisher,
      required this.bookImageUrl,
      required final List<String> translators})
      : _authors = authors,
        _translators = translators;

  factory _$BookImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookImplFromJson(json);

  @override
  final String title;
  final List<String> _authors;
  @override
  List<String> get authors {
    if (_authors is EqualUnmodifiableListView) return _authors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_authors);
  }

  @override
  final String description;
  @override
  final String isbn;
  @override
  final String publisher;
  @override
  final String bookImageUrl;
  final List<String> _translators;
  @override
  List<String> get translators {
    if (_translators is EqualUnmodifiableListView) return _translators;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_translators);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Book(title: $title, authors: $authors, description: $description, isbn: $isbn, publisher: $publisher, bookImageUrl: $bookImageUrl, translators: $translators)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Book'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('authors', authors))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('isbn', isbn))
      ..add(DiagnosticsProperty('publisher', publisher))
      ..add(DiagnosticsProperty('bookImageUrl', bookImageUrl))
      ..add(DiagnosticsProperty('translators', translators));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._authors, _authors) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isbn, isbn) || other.isbn == isbn) &&
            (identical(other.publisher, publisher) ||
                other.publisher == publisher) &&
            (identical(other.bookImageUrl, bookImageUrl) ||
                other.bookImageUrl == bookImageUrl) &&
            const DeepCollectionEquality()
                .equals(other._translators, _translators));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      const DeepCollectionEquality().hash(_authors),
      description,
      isbn,
      publisher,
      bookImageUrl,
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
      {required final String title,
      required final List<String> authors,
      required final String description,
      required final String isbn,
      required final String publisher,
      required final String bookImageUrl,
      required final List<String> translators}) = _$BookImpl;

  factory _Book.fromJson(Map<String, dynamic> json) = _$BookImpl.fromJson;

  @override
  String get title;
  @override
  List<String> get authors;
  @override
  String get description;
  @override
  String get isbn;
  @override
  String get publisher;
  @override
  String get bookImageUrl;
  @override
  List<String> get translators;
  @override
  @JsonKey(ignore: true)
  _$$BookImplCopyWith<_$BookImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
