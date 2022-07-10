import 'package:flutter/material.dart';
import 'package:forum_diskusi/view/explore%20topik/explore_screen.dart';
import 'package:forum_diskusi/view/home/home_screen.dart';
import 'package:forum_diskusi/view/notifikasi/notifikasi_screen.dart';
import 'package:forum_diskusi/view/profil/thread_profile.dart';
import 'package:forum_diskusi/view/search/search_screen.dart';

import '../ranking/ranking_screen.dart';

class HomeNav extends StatefulWidget {
  const HomeNav({Key? key}) : super(key: key);

  @override
  _HomeNavState createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  int _selectedIndex = 0;
  final _layoutPage = [const HomeScreen(), const SearchScreen(), const ExploreScreen(),const RankingScreen(), const ProfileTread()
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
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xffABABAB),
        unselectedItemColor: const Color(0xffABABAB),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color(0xffABABAB),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Color(0xffABABAB),
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.folder,
              color: Color(0xffABABAB),
            ),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.auto_awesome_rounded,
              color: Color(0xffABABAB),
            ),
            label: "Rangking",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Color(0xffABABAB),
            ),
            label: "Profile",
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onTabItem,
      ),
    );
  }
}
