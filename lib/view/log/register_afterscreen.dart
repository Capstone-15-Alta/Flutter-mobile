import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forum_diskusi/view/log/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisAfterScreen extends StatelessWidget {
  const RegisAfterScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 50, right: 50),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/image/ThankyouImage.svg',
                fit: BoxFit.fill, height: 180, width: 180),
                const SizedBox(height: 40,),
                Text(
                  "Terimakasih, data anda\nberhasil disimpan",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontSize: 12,color:const Color(0xffABABAB), fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 40,),
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
        )
        ),
    );
  }
}