import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TapPage extends StatefulWidget {
  final Widget child;

  const TapPage({super.key, required this.child});

  @override
  State<TapPage> createState() => _TapPageState();
}

class _TapPageState extends State<TapPage> {
  int _currentIndex = 0;
  final _locations = ['/home', '/reviewSearching','/raking',  '/account'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          context.go(_locations[index]);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'MyReviews',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Raking',
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
