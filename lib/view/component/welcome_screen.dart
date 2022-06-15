import 'package:flutter/material.dart';
import 'package:forum_diskusi/view/log/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            margin: const EdgeInsets.only(left: 60, right: 60),
            child: Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const SizedBox(
                  height: 300,
                  width: 300,
                  child: Image(image: AssetImage("assets/image/welcomeImage.PNG")),
                ),
                
                const SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Mari Kita\nDimulai",
                    style: GoogleFonts.poppins(
                        fontSize: 30, fontWeight: FontWeight.w700, color: const Color(0xff26B893)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                      "Terhubung satu sama lain saat diskusi atau.\nNikmati obrolan diskusi yang nyaman",
                      style: GoogleFonts.poppins(
                        fontSize: 13,  color: const Color(0xff26B893)),
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) {
                              return const LoginScreen();
                            }, transitionsBuilder:
                                    (context, animation, secondaryAnimation, child) {
                              final tween = Tween(begin: 0.0, end: 2.0);
                              return FadeTransition(
                                  opacity: animation.drive(tween), child: child);
                            }),
                          );
                        },
                        child: Text("Gabung Sekarang", style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w500),),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(const Color(0xff26B893))
                        ),
                      ),
                          
                  )
              ],
                ),
            ),
          ),
        ),
    );
  }
}