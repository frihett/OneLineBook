import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:untitled9/data/mapper/book_mapper.dart';

import '../../domain/model/book.dart';
import '../dto/BookInfoDto.dart';

class BookApi {
  final String _baseUrl = dotenv.get('KAKAO_BASE_URL');
  final String apiKey = dotenv.get('KAKAO_API_KEY');

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
