import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:untitled9/domain/model/book.dart';
import 'package:untitled9/domain/model/review.dart';

final book = Book(
  title: 'Sample Book',
  authors: ['Author Name'],
  description: 'Book Description',
  isbn: '1234567890',
  publisher: 'Publisher Name',
  bookImageUrl: 'http://example.com/book.jpg',
  translators: [],
);

final review = Review(
  reviewId: 'review_01',
  userId: 'user_01',
  bookId: 'book_01',
  book: book,
  content: 'Great book!',
  createdAt: DateTime.now().toIso8601String(),
);

void main() {
  test('Review toJson and fromJson test', () {
    // Convert Review to JSON
    final reviewJson = review.toJson();
    print('Review JSON: ${json.encode(reviewJson)}');

    // Check if JSON contains the expected fields
    expect(reviewJson, containsPair('reviewId', 'review_01'));
    expect(reviewJson, containsPair('userId', 'user_01'));
    expect(reviewJson, containsPair('bookId', 'book_01'));
    expect(reviewJson, containsPair('content', 'Great book!'));

    // Convert JSON back to Review
    final reviewFromJson = Review.fromJson(reviewJson);

    // Verify that the converted Review is equal to the original Review
    expect(reviewFromJson.reviewId, review.reviewId);
    expect(reviewFromJson.userId, review.userId);
    expect(reviewFromJson.bookId, review.bookId);
    expect(reviewFromJson.content, review.content);
    expect(reviewFromJson.createdAt, review.createdAt);

    // Check if the Book within Review is also correct
    expect(reviewFromJson.book.title, review.book.title);
    expect(reviewFromJson.book.authors, review.book.authors);
    expect(reviewFromJson.book.description, review.book.description);
    expect(reviewFromJson.book.isbn, review.book.isbn);
    expect(reviewFromJson.book.publisher, review.book.publisher);
    expect(reviewFromJson.book.bookImageUrl, review.book.bookImageUrl);
    expect(reviewFromJson.book.translators, review.book.translators);
  });
}