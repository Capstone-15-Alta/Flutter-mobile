// import 'package:banku/screen/home/home_screen.dart';
// import 'package:banku/screen/myNovel/my_novel.dart';
// import 'package:banku/screen/home/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:forum_diskusi/view/component/splash_screen.dart';
// import 'package:forum_diskusi/component/splash_screen.dart';
import 'package:forum_diskusi/view/home/home_screen.dart';
// import 'package:forum_diskusi/view/home/mod10.dart';

class HomeNav extends StatefulWidget {
  const HomeNav({Key? key}) : super(key: key);

  @override
  _HomeNavState createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  int _selectedIndex = 0;
  final _layoutPage = [const HomeScreen(), const SplashScreen()
  ];
  void _onTabItem(int index) {
    setState(
      () {
      _selectedIndex = index;
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _layoutPage.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff00726D),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.folder,
              color: Colors.white,
            ),
            label: "ye",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pending,
              color: Colors.white,
            ),
            label: "profile",
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onTabItem,
      ),
    );
  }
}
