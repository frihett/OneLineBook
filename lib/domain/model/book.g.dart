// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookImpl _$$BookImplFromJson(Map<String, dynamic> json) => _$BookImpl(
      title: json['title'] as String,
      authors:
          (json['authors'] as List<dynamic>).map((e) => e as String).toList(),
      description: json['description'] as String,
      isbn: json['isbn'] as String,
      publisher: json['publisher'] as String,
      bookImageUrl: json['bookImageUrl'] as String,
      translators: (json['translators'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$BookImplToJson(_$BookImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'authors': instance.authors,
      'description': instance.description,
      'isbn': instance.isbn,
      'publisher': instance.publisher,
      'bookImageUrl': instance.bookImageUrl,
      'translators': instance.translators,
    };
