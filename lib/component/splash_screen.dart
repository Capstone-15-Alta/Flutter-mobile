import 'package:flutter/material.dart';
import 'package:forum_diskusi/component/nav_animator.dart';
import 'package:forum_diskusi/home/home_screen.dart';
import 'package:forum_diskusi/log/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context)
          .pushReplacement(NavigatorAnimation(child: const LoginScreen()));
    });
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1A1616),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/image/logo.png',
              fit: BoxFit.fill, height: 130, width: 130),
          Text(
            'Forum Group Diskusi',
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 40,
          ),
          const SpinKitThreeBounce(
            color: Colors.white,
            size: 40,
          )
        ],
      )),
    );
  }
}
