// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookImpl _$$BookImplFromJson(Map<String, dynamic> json) => _$BookImpl(
      authors:
          (json['authors'] as List<dynamic>).map((e) => e as String).toList(),
      contents: json['contents'] as String,
      datetime: DateTime.parse(json['datetime'] as String),
      isbn: json['isbn'] as String,
      publisher: json['publisher'] as String,
      thumbnail: json['thumbnail'] as String,
      translators: (json['translators'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$BookImplToJson(_$BookImpl instance) =>
    <String, dynamic>{
      'authors': instance.authors,
      'contents': instance.contents,
      'datetime': instance.datetime.toIso8601String(),
      'isbn': instance.isbn,
      'publisher': instance.publisher,
      'thumbnail': instance.thumbnail,
      'translators': instance.translators,
    };
