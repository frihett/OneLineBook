import 'package:untitled9/data/data_source/user_stream_data_source.dart';

import '../../domain/model/book.dart';
import '../../domain/model/user.dart';
import '../../domain/repository/user_stream_repository.dart';

class UserStreamRepositoryImpl implements UserStreamRepository{
  final UserStreamDataSource _userStreamDataSource;

  UserStreamRepositoryImpl({
    required UserStreamDataSource userStreamDataSource,
  }) : _userStreamDataSource = userStreamDataSource;

  Stream<User?> getUserStream({required String userId}) {
    return _userStreamDataSource.getUserStream(userId: userId);
  }

  Stream<List<Book>> getCurrentReadingBookList({required String userId}) {
    return _userStreamDataSource.getCurrentReadingBookList(userId: userId);
  }
}
