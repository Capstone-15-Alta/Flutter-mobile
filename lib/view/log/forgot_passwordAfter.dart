import 'package:flutter/material.dart';
import 'package:forum_diskusi/view/component/success_changePass.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassAfter extends StatefulWidget {
  const ForgotPassAfter({ Key? key }) : super(key: key);

  @override
  State<ForgotPassAfter> createState() => _ForgotPassAfterState();

  
}
  final TextEditingController emailController = TextEditingController();
  final TextEditingController kodeKonfirmasi = TextEditingController();
  final _formKey = GlobalKey<FormState>();

    

class _ForgotPassAfterState extends State<ForgotPassAfter> {

  

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordfirst = TextEditingController();
    final TextEditingController passwordConfirmation = TextEditingController();

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordfirst,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("mohon masukkan kata sandi anda");
        }
        if (!RegExp(r'^.{6,}$').hasMatch(value)) {
          return ("mohon masukkan kata sandi dengan benar");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          fillColor: const Color.fromARGB(255, 236, 240, 243),
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Masukan Kata Sandi Baru",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    final passwordConfirmField = TextFormField(
      autofocus: false,
      validator: (value) {
        if (passwordfirst.text !=
            passwordConfirmation.text) {
          return "kata sandi tidak persis";
        }
        return null;
      },
      controller: passwordConfirmation,
      onSaved: (value) {
        kodeKonfirmasi.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        fillColor: const Color.fromARGB(255, 236, 240, 243),
        filled: true,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Masukan Kata Sandi Baru Lagi",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    final masukButton = Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(10),
      color: const Color(0xff26B893),
      child: MaterialButton(
        minWidth: double.infinity,
        onPressed: () {
        },
        child: Text(
          "konfirmasi",
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
        ),
      ),
    );

    final haveAccount = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Sudah punya akun ?",
            style: GoogleFonts.poppins(color: const Color(0xff00726D), fontSize: 13),),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(
            PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
              return const SuccessChangePassScreen();
            }, transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
              final tween = Tween(begin: 0.0, end: 2.0);
              return FadeTransition(
                  opacity: animation.drive(tween), child: child);
            }),
          );
          },
          child: Text(
            "Ubah",
            style: GoogleFonts.poppins(color: const Color(0xff00726D), fontSize: 13),
          ),
        ),
      ],
    );

    return Scaffold(
      body: SafeArea(
        child: Container(
        margin: const EdgeInsets.only(left: 40, right: 40),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Atur ulang kata sandi\nanda",
                  style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff26B893)),
                ),
              ),
              Text(
                "Halo, atur ulang kata sandi anda",
                style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w200,
                    color: const Color(0xff26B893)),
              ),
              const SizedBox(
                height: 35,
              ),
              Text(
                "Kata Sandi Baru",
                style: GoogleFonts.poppins(
                    fontSize: 13, color: const Color(0xff26B893)),
              ),
              const SizedBox(
                height: 10,
              ),
              passwordField,
              const SizedBox(
                height: 10,
              ),
              Text(
                "Kata Sandi Baru Lagi",
                style: GoogleFonts.poppins(
                    fontSize: 13, color: const Color(0xff26B893)),
              ),
              const SizedBox(
                height: 10,
              ),
              passwordConfirmField,
              const SizedBox(height: 20,),
              masukButton,
              haveAccount
            ],
          ),
        ),
        ),
      ),
    );
  }
}