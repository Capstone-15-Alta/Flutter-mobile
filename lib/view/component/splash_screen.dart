import 'package:flutter/material.dart';
import 'package:forum_diskusi/view/component/nav_animator.dart';
import 'package:forum_diskusi/view/home/home_nav.dart';
import 'package:forum_diskusi/view/log/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Future.delayed(const Duration(seconds: 4), () {
      pref.getString('token') != null
          ? Navigator.of(context).pushReplacement(
              NavigatorAnimation(
                child: const HomeNav(),
              ),
            )
          : Navigator.of(context).pushReplacement(
              NavigatorAnimation(
                child: const LoginScreen(),
              ),
            );
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
      backgroundColor: const Color(0xffffffff),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/image/logo.svg',
              fit: BoxFit.fill, height: 130, width: 130),
          Text(
            'Forum Group Diskusi',
            style: GoogleFonts.poppins(
                color: const Color(0xff88DFC9),
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 40,
          ),
          const SpinKitThreeBounce(
            color: Color(0xff88DFC9),
            size: 40,
          )
        ],
      )),
    );
  }
}
