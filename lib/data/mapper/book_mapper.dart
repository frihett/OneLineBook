import '../../domain/model/book.dart';
import '../dto/BookInfoDto.dart';

extension ToBook on BookInfoDto {
  Book toBook() {
    return Book(
      title: title ?? '',
      authors: authors ?? [''],
      description: contents ?? '',
      isbn: isbn ?? '',
      publisher: publisher ?? '',
      bookImageUrl: thumbnail ?? '',
      translators: translators ?? [''],
    );
  }
}
