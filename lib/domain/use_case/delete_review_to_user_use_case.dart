import 'package:untitled9/domain/repository/user_repository.dart';

import '../model/review.dart';

class DeleteReviewToUserUseCase {
  final UserRepository _userRepository;

  const DeleteReviewToUserUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  Future<void> execute({required String userId, required Review review}) async {
    _userRepository.deleteReviewToUser(userId: userId, review: review);
  }
}
