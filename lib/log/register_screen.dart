import 'package:flutter/material.dart';
import 'package:forum_diskusi/home/home_screen.dart';
import 'package:forum_diskusi/log/register_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _showPassword = true;
  bool checkedValue = false;
  @override
  void initState() {
    _showPassword = false;
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nomorController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController namaEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final namaField = TextFormField(
      controller: namaEditingController,
      validator: (value) {
        RegExp regex = RegExp(r'^.{4,}$');
        if (value!.isEmpty) {
          return ("Please enter your username");
        }
        if (!regex.hasMatch(value)) {
          return ("Please enter valid username (Min. 4 Character)");
        }
        return null;
      },
      onSaved: (value) {
        namaEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          fillColor: const Color.fromARGB(255, 236, 240, 243),
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Masukan Nama",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    final emailField = IntlPhoneField(
      showCountryFlag: false,
      autofocus: false,
      controller: nomorController,
      keyboardType: TextInputType.number,
      initialCountryCode: 'IN',
      onChanged: (phone) {},
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return ("please enter your phone number");
      //   }
      //   if (!RegExp(r'^.{12,}$').hasMatch(value)) {
      //     return ("Please enter a valid email");
      //   }
      //   return null;
      // },
      // onSaved: (value) {
      //   nomorController.text = value!;
      // },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          fillColor: const Color.fromARGB(255, 236, 240, 243),
          filled: true,
          prefixIcon: const Icon(Icons.email),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Masukan Nomer",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    final passwordField = TextFormField(
      autofocus: false,
      // validator: (value) {
      //   RegExp regex = RegExp(r'^.{6,}$');
      //   if (value!.isEmpty) {
      //     return ("Please enter your password");
      //   }
      //   if (!regex.hasMatch(value)) {
      //     return ("Please enter valid password (Min. 6 Character");
      //   }
      //   return null;
      // },
      controller: passwordController,
      obscureText: !_showPassword,
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        fillColor: const Color.fromARGB(255, 236, 240, 243),
        filled: true,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Masukan Kata Sandi",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        suffixIcon: IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            _showPassword ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _showPassword = !_showPassword;
            });
          },
        ),
      ),
    );

    final loginButton = Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(10),
      color: const Color(0xff00726D),
      child: MaterialButton(
        minWidth: double.infinity,
        onPressed: () {
          Navigator.of(context).push(
            PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
              return const HomeScreen();
            }, transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
              final tween = Tween(begin: 0.0, end: 2.0);
              return FadeTransition(
                  opacity: animation.drive(tween), child: child);
            }),
          );
        },
        child: Text(
          "Log in",
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
        ),
      ),
    );

    final dontHaveAccount = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Sudah punya akun ?",
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 13),),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
            PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
              return const RegisterScreen();
            }, transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
              final tween = Tween(begin: 0.0, end: 2.0);
              return FadeTransition(
                  opacity: animation.drive(tween), child: child);
            }),
          );
          },
          child:  Text(
            "Masuk",
            style: GoogleFonts.poppins(color: const Color(0xff00726D), fontSize: 13),
          ),
        ),
      ],
    );

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xff191616),
        body: Container(
          margin: const EdgeInsets.only(left: 35, right: 35),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Buat Akun",
                  style: GoogleFonts.poppins(
                      fontSize: 27,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                Text(
                  "Terhubung dengan Teman Anda Sekarang!",
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w200,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Nama",
                  style: GoogleFonts.poppins(fontSize: 13, color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                namaField,
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "Nomor Handphone",
                  style: GoogleFonts.poppins(fontSize: 13, color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                emailField,
                Text(
                  "Password",
                  style: GoogleFonts.poppins(fontSize: 13, color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                passwordField,
                Theme(
                  data: ThemeData(unselectedWidgetColor: Colors.white),
                  child: CheckboxListTile(
                    checkColor: Colors.black,
                    activeColor: Colors.white,
                    selectedTileColor: Colors.white,
                    title: Text("Saya menyetujui syarat dan ketentuan", style: GoogleFonts.poppins(fontSize: 12,color: Colors.white),),
                    value: checkedValue,
                    onChanged: (newValue) {
                      setState(() {
                        checkedValue = newValue!;
                      });
                    },
                    controlAffinity:
                        ListTileControlAffinity.leading,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                loginButton,
                dontHaveAccount
              ],
            ),
          ),
        ),
      ),
    );
  }
}
