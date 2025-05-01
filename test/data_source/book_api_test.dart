import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:untitled9/data/data_source/book_api.dart';
import 'package:untitled9/domain/model/book.dart';

import 'book_api_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('BookApi', () {
    test('getBook이 200 응답을 받으면 Book 리스트를 반환한다', () async {
      final client = MockClient();

      const baseUrl = 'https://fake-url.com';
      const apiKey = 'FAKE_API_KEY';
      const query = '테스트';

      final fakeResponse = jsonEncode({
        "meta": {
          "is_end": true,
          "pageable_count": 1,
          "total_count": 1
        },
        "documents": [
          {
            "authors": ["홍길동"],
            "contents": "이 책은 테스트용입니다.",
            "datetime": "2025-01-01T00:00:00.000+09:00",
            "isbn": "1234567890 9781234567890",
            "price": 10000,
            "publisher": "테스트출판사",
            "sale_price": 9000,
            "status": "정상판매",
            "thumbnail": "https://example.com/test-thumbnail.jpg",
            "title": "테스트 책 제목",
            "translators": ["이몽룡"],
            "url": "https://example.com/test-book"
          }
        ]
      });


      final url = Uri.parse('$baseUrl?query=$query');
      final headers = {
        'Authorization': 'KakaoAK $apiKey',
      };

      // 한글 문제 -> 바이트로 전환
      when(client.get(url, headers: headers)).thenAnswer(
            (_) async => http.Response.bytes(
          utf8.encode(fakeResponse),
          200,
          headers: {'content-type': 'application/json; charset=utf-8'},
        ),
      );

      final api = BookApi(
        client: client,
        baseUrl: baseUrl,
        apiKey: apiKey,
      );

      final result = await api.getBook(query: query);

      expect(result, isA<List<Book>>());
      expect(result.length, 1);
      expect(result.first.title, '테스트 책 제목');
    });


  });
}