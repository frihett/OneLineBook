import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled9/data/mapper/book_mapper.dart';

import '../../domain/model/book.dart';
import '../dto/BookInfoDto.dart';

class BookApi {
  Future<List<Book>> getBook({required String query}) async {
    var url = 'https://dapi.kakao.com/v3/search/book';
    var apiKey = '1934bda87c8f2d04588a246af4df2040';

    var response = await http.get(
      Uri.parse('$url?query=$query'),
      headers: {
        'Authorization': 'KakaoAK $apiKey',
      },
    );

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
