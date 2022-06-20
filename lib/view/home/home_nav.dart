import 'package:flutter/material.dart';
import 'package:forum_diskusi/view/home/home_screen.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:forum_diskusi/view/home/home_thread.dart';
import 'package:forum_diskusi/view/notifikasi/notifikasi_screen.dart';
import 'package:forum_diskusi/view/search/search_screen.dart';

class HomeNav extends StatefulWidget {
  const HomeNav({Key? key}) : super(key: key);

  @override
  _HomeNavState createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  int _selectedIndex = 0;
  final _layoutPage = [const HomeScreen(), const SearchScreen(),const NotifScreen()
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
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color(0xffABABAB),
            ),
            label: "Home",
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     FeatherIcons.feather,
          //     color: Color(0xffABABAB),
          //   ),
          //   label: "Create",
          // ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Color(0xffABABAB),
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              color: Color(0xffABABAB),
            ),
            label: "Notifikasi",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Color(0xffABABAB),
            ),
            label: "Profile",
          ),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        onTap: _onTabItem,
      ),
    );
  }
}
