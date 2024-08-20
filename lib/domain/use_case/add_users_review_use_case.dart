
import '../model/review.dart';
import '../repository/user_repository.dart';

class AddUsersReviewUseCase {
  final UserRepository _userRepository;

   AddUsersReviewUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

   Future<void> execute({required String userId , required Review review}) async{
     _userRepository.addReviewToUser(userId: userId, review: review);
   }


}
