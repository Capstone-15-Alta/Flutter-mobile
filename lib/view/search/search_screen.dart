import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final searchField = TextFormField(
      autofocus: false,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Mohon diisi yang ingin di cari");
        }
        return null;
      },
      // controller: nomorController,
      onSaved: (value) {
        // nomorController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        fillColor: const Color.fromARGB(255, 236, 240, 243),
        prefixIcon: const Icon(Icons.search),
        filled: true,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Cari di Forum Grup Diskusi",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: SvgPicture.asset(
                "assets/image/logo.svg",
                height: 35,
                width: 35,
              )),
              const SizedBox(
                height: 30,
              ),
              searchField,
              const SizedBox(
                height: 20,
              ),
              Text("Saran",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: const Color(0xff26B893))),
                      const SizedBox(height: 20,),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 23.0,
                    backgroundImage: NetworkImage(
                        "https://www.kindpng.com/picc/m/24-248325_profile-picture-circle-png-transparent-png.png"),
                    backgroundColor: Colors.transparent,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text("nama"),
                  const Spacer(),
                  Container(
                    height: 35,
                    width: 80,
                    decoration: BoxDecoration(
                        color: const Color(0xff26B893),
                        borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [Icon(Icons.add, color: Colors.white,), Text("Ikuti", style: TextStyle(color: Colors.white),)],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
