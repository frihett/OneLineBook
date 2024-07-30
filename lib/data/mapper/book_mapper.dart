import '../../domain/model/book.dart';
import '../dto/BookInfoDto.dart';

extension ToBook on BookInfoDto {
  Book toBook() {
    return Book(
      title: title ?? '',
      authors: authors ?? [''],
      contents: contents ?? '',
      datetime:
          datetime != null ? DateTime.parse(datetime!) : DateTime(1970, 1, 1),
      isbn: isbn ?? '',
      publisher: publisher ?? '',
      thumbnail: thumbnail ?? '',
      translators: translators ?? [''],
    );
  }
}
