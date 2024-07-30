import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled9/data/repository/book_repository_impl.dart';
import 'package:untitled9/presentation/tap/ranking/raking_page.dart';
import 'package:untitled9/presentation/tap/review_search/review_page.dart';
import 'package:untitled9/presentation/tap/review_search/review_page_view_model.dart';
import 'package:untitled9/presentation/tap/writing/writing_page.dart';
import 'package:untitled9/presentation/tap/writing/writing_page_view_model.dart';

import 'account/account_page.dart';
import 'account/account_page_view_model.dart';
import 'home/home_page.dart';
import 'home/home_page_view_model.dart';

class TapPage extends StatefulWidget {
  const TapPage({super.key});

  @override
  State<TapPage> createState() => _TapPageState();
}

class _TapPageState extends State<TapPage> {
  int _currentIndex = 0;
  final _pages = [
    HomePage(
      homePageViewModel:
          HomePageViewModel(bookRepository: BookRepositoryImpl()),
    ),
    ChangeNotifierProvider(
      create: (context) => ReviewPageViewModel(),
      child: ReviewPage(),
    ),
    ChangeNotifierProvider(
      create: (context) => WritingPageViewModel(),
      child: WritingPage(      ),
    ),
    RankingPage(),
    ChangeNotifierProvider(
      create: (context) => AccountViewModel(),
      child: AccountPage(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Reviews',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.perm_media_rounded),
            label: 'Ranking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
