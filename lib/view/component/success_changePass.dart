import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessChangePassScreen extends StatelessWidget {
  const SuccessChangePassScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final masukButton = Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(10),
      color: const Color(0xff26B893),
      child: MaterialButton(
        minWidth: double.infinity,
        onPressed: () {
        },
        child: Text(
          "Masuk",
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
        ),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 35, right: 35),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/image/imageSuccess.svg',
                fit: BoxFit.fill, height: 200, width: 200),
                const SizedBox(height: 40,),
                Text(
                  "Horee, Kata sandi anda berhasil di perbarui,\nMasuk sekarang untuk memulai diskusi",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontSize: 15, color: const Color(0xffABABAB)),
                ),
                const SizedBox(height: 40,),
                masukButton
              ],  
            ),
          ),
        ),
      ),
    );
  }
}