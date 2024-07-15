import 'package:flutter/material.dart';
import 'package:untitled9/tap/account/account_page.dart';
import 'package:untitled9/tap/home/home_page.dart';
import 'package:untitled9/tap/ranking/raking_page.dart';
import 'package:untitled9/tap/search/search_page.dart';
import 'package:untitled9/tap/writing/writing_page.dart';

class TapPage extends StatefulWidget {
  const TapPage({super.key});

  @override
  State<TapPage> createState() => _TapPageState();
}

class _TapPageState extends State<TapPage> {
  int _currentIndex = 0;
  final _pages = const [
    HomePage(),
    SearchPage(),
    WritingPage(),
    RankingPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          print('잘되가나');
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
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'Writing',
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
