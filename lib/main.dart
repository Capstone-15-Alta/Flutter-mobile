import 'package:flutter/material.dart';
import 'package:forum_diskusi/view/component/splash_screen.dart';
import 'package:forum_diskusi/viewmodel/comments_viewModel.dart';
import 'package:forum_diskusi/viewmodel/kategori_viewModel.dart';
import 'package:forum_diskusi/viewmodel/login_viewModel.dart';
import 'package:forum_diskusi/viewmodel/ranking_viewModel.dart';
import 'package:forum_diskusi/viewmodel/register_viewModel.dart';
import 'package:forum_diskusi/viewmodel/search_viewModel.dart';
import 'package:forum_diskusi/viewmodel/thread_viewModel.dart';
import 'package:forum_diskusi/viewmodel/trendingThread_viewModel.dart';
import 'package:forum_diskusi/viewmodel/user_viewModel.dart';
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
          ChangeNotifierProvider(create: (_) => TrendingTreadViewModel()),
          ChangeNotifierProvider(create: (_) => UserViewModel()),
          ChangeNotifierProvider(create: (_) => RankingUserViewModel()),
          ChangeNotifierProvider(create: (_) => SearchUserViewModel()),
          ChangeNotifierProvider(create: (_) => KategoriViewModel()),
          ChangeNotifierProvider(create: (_) => CommentsViewModel()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const SplashScreen(),
        ));
  }
}
