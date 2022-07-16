import 'package:flutter/material.dart';
import 'package:forum_diskusi/model/register_model.dart';
import 'package:forum_diskusi/view/log/register_afterscreen.dart';
import 'package:forum_diskusi/viewmodel/register_viewModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterViewModel>(context);
    final namaField = TextFormField(
      controller: usernameController,
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
        usernameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          fillColor: const Color.fromARGB(255, 236, 240, 243),
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Masukan Nama",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Masukan Email");
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-].[a-z]").hasMatch(value)) {
          return ("Please enter a valid email");
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          fillColor: const Color.fromARGB(255, 236, 240, 243),
          filled: true,
          prefixIcon: const Icon(Icons.email),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Masukkan Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    final passwordField = TextFormField(
      
      autofocus: false,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Masukkan Password");
        }
        if (!regex.hasMatch(value)) {
          return ("Password minimal 6 karakter");
        }
        return null;
      },
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
        hintText: "Masukan Password",
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

    final registerButton = Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(10),
      color: const Color(0xffABABAB),
      child: MaterialButton(
        minWidth: double.infinity,
        onPressed: () async {
          if(_formKey.currentState!.validate()){
            _formKey.currentState!.save();

            await Future.delayed(
              const Duration(seconds: 2),
            ).then((value) => registerProvider.postRegister(RegisterModel(
                    username: usernameController.text,
                    email: emailController.text,
                    password: passwordController.text
                    ))).then((_) => Navigator.of(context).push(
            PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
              return const RegisAfterScreen();
            }, transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
              final tween = Tween(begin: 0.0, end: 2.0);
              return FadeTransition(
                  opacity: animation.drive(tween), child: child);
            }),
          ));

            
          }
        },
        child: Text(
          "Daftar",
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
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
              return const RegisAfterScreen();
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
            style: GoogleFonts.poppins(color: Colors.black, fontSize: 13),
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
                Text(
                  "Selamat datang silahkan\ndaftar",
                  style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xffABABAB)),
                ),
                Text(
                  "Terhubung dengan Teman Anda Sekarang!",
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xffABABAB)),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Nama",
                  style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w500,color: const Color(0xff26B893)),
                ),
                const SizedBox(
                  height: 10,
                ),
                namaField,
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Email",
                  style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w500,color: const Color(0xff26B893)),
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
                  style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w500,color: const Color(0xff26B893)),
                ),
                const SizedBox(
                  height: 10,
                ),
                passwordField,
                const SizedBox(
                  height: 30,
                ),
                registerButton,
                haveAccount
              ],
            ),
          ),
        ),
      ),
    );
  }
}
