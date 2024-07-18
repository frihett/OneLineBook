import 'package:untitled9/dto/BookInfoDto.dart';

import '../model/book.dart';

extension ToBook on BookInfoDto {
  Book toBook() {
    return Book(
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
