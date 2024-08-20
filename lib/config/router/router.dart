import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:untitled9/core/provider/user_provider.dart';
import 'package:untitled9/data/data_source/google_sign_in_data_source.dart';
import 'package:untitled9/data/data_source/review_data_source.dart';
import 'package:untitled9/data/data_source/user_data_source.dart';
import 'package:untitled9/data/data_source/user_stream_data_source.dart';
import 'package:untitled9/data/repository/book_repository_impl.dart';
import 'package:untitled9/data/repository/firebase_auth_repository_impl.dart';
import 'package:untitled9/data/repository/review_repository_impl.dart';
import 'package:untitled9/data/repository/user_repository_impl.dart';
import 'package:untitled9/data/repository/user_stream_repository_impl.dart';
import 'package:untitled9/domain/use_case/add_current_reading_book_use_case.dart';
import 'package:untitled9/domain/use_case/add_users_review_use_case.dart';
import 'package:untitled9/domain/use_case/create_review_use_case.dart';
import 'package:untitled9/domain/use_case/create_user_use_case.dart';
import 'package:untitled9/domain/use_case/delete_current_reading_book_use_case.dart';
import 'package:untitled9/domain/use_case/delete_review_to_user_use_case.dart';
import 'package:untitled9/domain/use_case/edit_review_use_case.dart';
import 'package:untitled9/domain/use_case/get_review_use_case.dart';
import 'package:untitled9/domain/use_case/get_user_use_case.dart';
import 'package:untitled9/presentation/tap/account/account_page.dart';
import 'package:untitled9/presentation/tap/account/account_page_view_model.dart';
import 'package:untitled9/presentation/tap/home/home_page.dart';
import 'package:untitled9/presentation/tap/home/home_page_view_model.dart';
import 'package:untitled9/presentation/tap/login/login_page.dart';
import 'package:untitled9/presentation/tap/login/login_page_view_model.dart';
import 'package:untitled9/presentation/tap/ranking/raking_page.dart';
import 'package:untitled9/presentation/tap/review_search/review_page.dart';
import 'package:untitled9/presentation/tap/review_search/review_page_view_model.dart';
import 'package:untitled9/presentation/tap/search/search_page.dart';
import 'package:untitled9/presentation/tap/search/search_page_view_model.dart';
import 'package:untitled9/presentation/tap/splash/splash_page.dart';
import 'package:untitled9/presentation/tap/tap_page.dart';
import 'package:untitled9/presentation/tap/writing/writing_page.dart';
import 'package:untitled9/presentation/tap/writing/writing_page_view_model.dart';

import '../../domain/model/book.dart';

final goRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
        path: '/splash',
        builder: (context, state) {
          return SplashScreen();
        }),
    ShellRoute(
      builder: (context, state, child) {
        return TapPage(child: child);
      },
      routes: [
        GoRoute(
            path: '/home',
            builder: (context, state) {
              return ChangeNotifierProvider(
                create: (context) => HomePageViewModel(
                    userStreamRepository: UserStreamRepositoryImpl(
                        userStreamDataSource: UserStreamDataSource()),
                    deleteCurrentReadingBookUseCase:
                        DeleteCurrentReadingBookUseCase(
                            userRepository: UserRepositoryImpl(
                                userDataSource: UserDataSource()))),
                child: HomePage(),
              );
            }),
        GoRoute(
            path: '/reviewSearching',
            builder: (context, state) {
              return ChangeNotifierProvider(
                  create: (context) => ReviewPageViewModel(
                      deleteReviewToUserUseCase: DeleteReviewToUserUseCase(
                          userRepository: UserRepositoryImpl(
                              userDataSource: UserDataSource())),
                      editReviewUseCase: EditReviewUseCase(
                          userRepository: UserRepositoryImpl(
                              userDataSource: UserDataSource()),
                          reviewRepository: ReviewRepositoryImpl(
                              reviewDataSource: ReviewDataSource()))),
                  child: ReviewPage());
            }),
        GoRoute(
            path: '/raking',
            builder: (context, state) {
              return RankingPage();
            }),
        GoRoute(
            path: '/account',
            builder: (context, state) {
              return ChangeNotifierProvider(
                  create: (context) => AccountViewModel(),
                  child: AccountPage());
            }),
      ],
    ),

    GoRoute(
        path: '/bookSearching',
        builder: (context, state) {
          return ChangeNotifierProvider(
              create: (context) => SearchPageViewModel(
                  bookRepository: BookRepositoryImpl(),
                  addCurrentReadingBookUseCase: AddCurrentReadingBookUseCase(
                      userRepository: UserRepositoryImpl(
                          userDataSource: UserDataSource()))),
              child: SearchPage());
        }),
    // ChangeNotifierProvider(
    //       create: (context) => UserProvider(), child: MyApp())
    GoRoute(
        path: '/writing',
        builder: (context, state) {
          final book = state.extra as Book?;

          return ChangeNotifierProvider(
              create: (context) => WritingPageViewModel(
                  createReviewUseCase: CreateReviewUseCase(
                      reviewRepository: ReviewRepositoryImpl(
                          reviewDataSource: ReviewDataSource())),
                  addUsersReviewUseCase: AddUsersReviewUseCase(
                      userRepository:
                          UserRepositoryImpl(userDataSource: UserDataSource())),
                  getReviewUseCase: GetReviewUseCase(
                      reviewRepository: ReviewRepositoryImpl(
                          reviewDataSource: ReviewDataSource()))),
              child: WritingPage(
                book: book,
              ));
        }),

    GoRoute(
        path: '/login',
        builder: (context, state) {
          return ChangeNotifierProvider(
            create: (context) => LoginPageViewModel(
                firebaseAuthRepository: FirebaseAuthRepositoryImpl(
                    googleSignInDataSource: GoogleSignInDataSource()),
                userProvider: UserProvider(
                    getUserUseCase: GetUserUseCase(
                        userRepository: UserRepositoryImpl(
                            userDataSource: UserDataSource())),
                    createUserUseCase: CreateUserUseCase(
                        userRepository: UserRepositoryImpl(
                            userDataSource: UserDataSource())))),
            child: LoginPage(),
          );
        }),
  ],
);
