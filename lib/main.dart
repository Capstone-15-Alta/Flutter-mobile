import 'package:flutter/material.dart';
import 'package:forum_diskusi/view/component/splash_screen.dart';
import 'package:forum_diskusi/view/home/home_nav.dart';
import 'package:forum_diskusi/viewmodel/kategori_viewModel.dart';
import 'package:forum_diskusi/viewmodel/login_viewModel.dart';
import 'package:forum_diskusi/viewmodel/register_viewModel.dart';
import 'package:forum_diskusi/viewmodel/thread_viewModel.dart';
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
        ChangeNotifierProvider(create: (_) => RegisterViewModel()),
        ChangeNotifierProvider(create: (_) => ThreadViewModel()),
        ChangeNotifierProvider(create: (_) => KategoriViewModel()),
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