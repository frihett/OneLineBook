import 'package:flutter_test/flutter_test.dart';
import 'package:untitled9/domain/model/book.dart';

void main() {
  test('Book serialization test', () {
    testBookSerialization();
  });
}

void testBookSerialization() {
  Book book = Book(
    title: "Test Book",
    authors: ["Author1", "Author2"],
    description: "A book for testing",
    isbn: "123456789",
    publisher: "Test Publisher",
    bookImageUrl: "http://example.com/image.jpg",
    translators: ["Translator1", "Translator2"],
  );

  // Book 객체를 JSON으로 변환
  Map<String, dynamic> bookJson = book.toJson();
  print("Serialized Book JSON: $bookJson");

  // JSON을 다시 Book 객체로 변환
  Book deserializedBook = Book.fromJson(bookJson);
  print("Deserialized Book: $deserializedBook");

  // 확인: 원래 객체와 직렬화 후 복원된 객체가 동일한지
  expect(book, deserializedBook);
}