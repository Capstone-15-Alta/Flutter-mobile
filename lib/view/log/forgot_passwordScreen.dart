import 'package:flutter/material.dart';
import 'package:forum_diskusi/view/log/forgot_passwordAfter.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({ Key? key }) : super(key: key);

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();

  
}
  final TextEditingController emailController = TextEditingController();
  final TextEditingController kodeKonfirmasi = TextEditingController();
  final _formKey = GlobalKey<FormState>();

    

class _ForgotPassScreenState extends State<ForgotPassScreen> {

  

  @override
  Widget build(BuildContext context) {

    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("please enter your email");
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-].[a-z]").hasMatch(value)) {
          return ("Please enter a valid email");
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
          hintText: "Masukan Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    final kodeKonfirmasiField = TextFormField(
      autofocus: false,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Please enter your password");
        }
        if (!regex.hasMatch(value)) {
          return ("Please enter valid password (Min. 6 Character");
        }
        return null;
      },
      controller: kodeKonfirmasi,
      onSaved: (value) {
        kodeKonfirmasi.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        fillColor: const Color.fromARGB(255, 236, 240, 243),
        filled: true,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Masukan Kata Sandi",
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
              return const ForgotPassAfter();
            }, transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
              final tween = Tween(begin: 0.0, end: 2.0);
              return FadeTransition(
                  opacity: animation.drive(tween), child: child);
            }),
          );
          },
          child: Text(
            "Masuk",
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
                "Email",
                style: GoogleFonts.poppins(
                    fontSize: 13, color: const Color(0xff26B893)),
              ),
              const SizedBox(
                height: 10,
              ),
              emailField,
              const SizedBox(
                height: 10,
              ),
              Text(
                "kode Konfirmasi",
                style: GoogleFonts.poppins(
                    fontSize: 13, color: const Color(0xff26B893)),
              ),
              const SizedBox(
                height: 10,
              ),
              kodeKonfirmasiField,
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