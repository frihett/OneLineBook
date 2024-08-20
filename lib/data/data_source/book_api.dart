import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled9/data/mapper/book_mapper.dart';

import '../../domain/model/book.dart';
import '../dto/BookInfoDto.dart';

class BookApi {
  static const _baseUrl = 'https://dapi.kakao.com/v3/search/book';
  static const apiKey = '1934bda87c8f2d04588a246af4df2040';

  Future<List<Book>> getBook({required String query}) async {
    final url = Uri.parse('$_baseUrl?query=$query');
    final headers = {
      'Authorization': 'KakaoAK $apiKey',
    };

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final map = jsonDecode(response.body);

      List<dynamic> bookInfoJson =
          map['documents'] as List; // documents를 벗겨내고 list 로 받기

      Iterable<BookInfoDto> bookInfoJson2 = bookInfoJson
          .map((e) => BookInfoDto.fromJson(e)); // 리스트 요소들을 BookInfoDto 객체로 변환하기
      return bookInfoJson2
          .map((e) => e.toBook())
          .toList(); // BookInfoDto List map to Book List
    } else {
      throw Exception('Failed to load book');
    }
  }
}
