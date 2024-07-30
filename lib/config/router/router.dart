import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:untitled9/data/repository/book_repository_impl.dart';
import 'package:untitled9/presentation/tap/account/account_page.dart';
import 'package:untitled9/presentation/tap/home/home_page.dart';
import 'package:untitled9/presentation/tap/home/home_page_view_model.dart';
import 'package:untitled9/presentation/tap/login/login_page.dart';
import 'package:untitled9/presentation/tap/ranking/raking_page.dart';
import 'package:untitled9/presentation/tap/review_search/review_page.dart';
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
    GoRoute(
        path: '/tapPage',
        builder: (context, state) {
          return TapPage();
        }),
    GoRoute(
        path: '/account',
        builder: (context, state) {
          return AccountPage();
        }),
    GoRoute(
        path: '/home',
        builder: (context, state) {
          return HomePage(
              homePageViewModel:
                  HomePageViewModel(bookRepository: BookRepositoryImpl()));
        }),
    GoRoute(
        path: '/reviewSearching',
        builder: (context, state) {
          return ReviewPage();
        }),
    GoRoute(
        path: '/bookSearching',
        builder: (context, state) {
          return ChangeNotifierProvider(
              create: (context) =>
                  SearchPageViewModel(bookRepository: BookRepositoryImpl()),
              child: SearchPage());
        }),
    // ChangeNotifierProvider(
    //       create: (context) => UserProvider(), child: MyApp())
    GoRoute(
        path: '/writing',
        builder: (context, state) {
          final book = state.extra as Book?;

          return ChangeNotifierProvider(
              create: (context) => WritingPageViewModel(),
              child: WritingPage(
                book: book,
              ));
        }),
    GoRoute(
        path: '/raking',
        builder: (context, state) {
          return RankingPage();
        }),
    GoRoute(
        path: '/login',
        builder: (context, state) {
          return LoginPage();
        }),
  ],
);
