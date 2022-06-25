import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:forum_diskusi/model/login_model.dart';
import 'package:forum_diskusi/view/home/home_nav.dart';
import 'package:forum_diskusi/view/log/register_screen.dart';
import 'package:forum_diskusi/viewmodel/login_viewModel.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:flutter';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showPassword = true;
  bool checkedValue = false;
  @override
  void initState() {
    _showPassword = false;
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginViewModel>(context);

    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return ("Masukan Email");
      //   }
      //   if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-].[a-z]").hasMatch(value)) {
      //     return ("Please enter a valid email");
      //   }
      //   return null;
      // },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        fillColor: const Color.fromARGB(255, 236, 240, 243),
        filled: true,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Masukan Email",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: !_showPassword,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Masukan Password");
        }
        return null;
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        fillColor: const Color.fromARGB(255, 236, 240, 243),
        filled: true,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Masukan Password",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        suffixIcon: IconButton(
          icon: Icon(
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
      color: const Color(0xff26B893),
      child: MaterialButton(
        minWidth: double.infinity,
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            
            await Future.delayed(
              const Duration(seconds: 2),
            )
                .then((value) => loginProvider.postLogin(LoginModel(
                    username: emailController.text,
                    password: passwordController.text)))
                .then((_) => Navigator.of(context).push(
                      PageRouteBuilder(pageBuilder:
                          (context, animation, secondaryAnimation) {
                        return const HomeNav();
                      }, transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        final tween = Tween(begin: 0.0, end: 2.0);
                        return FadeTransition(
                            opacity: animation.drive(tween), child: child);
                      }),
                    )
                    // MaterialPageRoute(builder: (context)=> const HomeNav())
                    // )
                )
                .then(
                  (_) => Fluttertoast.showToast(msg: "Login succesful"),
                );
          }
        },
        child: Text(
          "Log in",
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
        ),
      ),
    );

    final forgonPass = TextButton(
      onPressed: (){}, 
      child: Text("Lupa password ?", style: GoogleFonts.poppins(fontSize: 13, color: const Color(0xff26B893)),)
    );

    final dontHaveAccount = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Belum punya akun ?",
          style:
              GoogleFonts.poppins(color: const Color(0xff00726D), fontSize: 13),
        ),
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
          child: Text(
            "Daftar",
            style: GoogleFonts.poppins(
                color: const Color(0xff00726D), fontSize: 13),
          ),
        ),
      ],
    );

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffFFFFFF),
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
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Halo! Selamat datang 👋 \nkembali!",
                    style: GoogleFonts.poppins(
                        fontSize: 27,
                        fontWeight: FontWeight.w300,
                        color: Colors.black),
                  ),
                ),
                Text(
                  "Halo lagi, Anda telah dirindukan!",
                  style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff00726D)),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Email",
                  style: GoogleFonts.poppins(
                      fontSize: 13, fontWeight: FontWeight.w600, color: const Color(0xff26B893)),
                ),
                const SizedBox(
                  height: 10,
                ),
                emailField,
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Password",
                  style: GoogleFonts.poppins(
                      fontSize: 13, fontWeight: FontWeight.w600,color: const Color(0xff26B893)),
                ),
                const SizedBox(
                  height: 10,
                ),
                passwordField,
                forgonPass,
                const SizedBox(
                  height: 20,
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
