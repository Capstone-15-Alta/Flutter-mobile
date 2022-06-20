import 'package:flutter/material.dart';
import 'package:forum_diskusi/view/home/home_nav.dart';
import 'package:forum_diskusi/view/notifikasi/notifikasi_screen.dart';
// import 'package:forum_diskusi/view/home/home_nav.dart';
// import 'package:forum_diskusi/view/home/home_thread.dart';
import 'package:forum_diskusi/view/search/search_screen.dart';
import 'package:forum_diskusi/view/viewModel/login_viewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [  
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
      ],
      child :MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeNav(),
    )
    );
    
  }
}