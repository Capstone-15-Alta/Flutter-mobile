import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotifikasiButton extends StatefulWidget {
  const NotifikasiButton({Key? key}) : super(key: key);

  @override
  State<NotifikasiButton> createState() => _NotifikasiButtonState();
}

class _NotifikasiButtonState extends State<NotifikasiButton> {
  bool _hasBeenPressedButton1 = false;
  bool _hasBeenPressedButton2 = false;
  bool _hasBeenPressedButton3 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: 50,
              width: 100,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: _hasBeenPressedButton1
                          ? const Color(0xff26B893)
                          : Colors.white,
                      onPrimary: _hasBeenPressedButton1
                          ? Colors.white
                          : const Color(0xff26B893),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          side: BorderSide(color: Color(0xff26B893)))),
                  onPressed: () {
                    setState(() {
                      if (_hasBeenPressedButton1 == false ||
                          _hasBeenPressedButton2 == true ||
                          _hasBeenPressedButton3 == true) {
                        _hasBeenPressedButton1 = true;
                        _hasBeenPressedButton2 = false;
                        _hasBeenPressedButton3 = false;
                      }
                    });
                  },
                  child: Text(
                    "Semua",
                    style: GoogleFonts.poppins(fontSize: 15),
                  )),
            ),
            const SizedBox(
              width: 15,
            ),
            SizedBox(
              height: 50,
              width: 100,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: _hasBeenPressedButton2
                          ? const Color(0xff26B893)
                          : Colors.white,
                      onPrimary: _hasBeenPressedButton1
                          ? const Color(0xff26B893)
                          : Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          side: BorderSide(color: Color(0xff26B893)))),
                  onPressed: () {
                    setState(() {
                      if (_hasBeenPressedButton1 == true ||
                          _hasBeenPressedButton2 == false ||
                          _hasBeenPressedButton3 == true) {
                        _hasBeenPressedButton2 = true;
                        _hasBeenPressedButton1 = false;
                        _hasBeenPressedButton3 = false;
                      }
                    });
                  },
                  child: Text(
                    "Belum\nDibaca",
                    style: GoogleFonts.poppins(fontSize: 15),
                    textAlign: TextAlign.center,
                  )),
            ),
            const Spacer(),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: _hasBeenPressedButton3
                          ? const Color(0xff26B893)
                          : Colors.white,
                      onPrimary: _hasBeenPressedButton1
                          ? const Color(0xff26B893)
                          : Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          side: BorderSide(color: Color(0xff26B893)))),
                  onPressed: () {
                    setState(() {
                      if (_hasBeenPressedButton1 == true ||
                          _hasBeenPressedButton2 == true ||
                          _hasBeenPressedButton3 == false) {
                        _hasBeenPressedButton3 = true;
                        _hasBeenPressedButton2 = false;
                        _hasBeenPressedButton1 = false;
                      }
                    });
                  },
                  child: Text(
                    "Baca\nSemuanya",
                    style: GoogleFonts.poppins(fontSize: 15),
                    textAlign: TextAlign.center,
                  )),
            ),
          ],
        ),
        SizedBox(
          height: 600,
          child: notifikasiTiapButton(),
        )
      ],
    );
  }

  Widget notifikasiTiapButton() {
    // if (){} //untuk mevalidasi kategori mana yang akan dipilih... ListView dalam if
    return ListView.separated(
        scrollDirection: Axis.vertical,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: 1,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 1,
              itemBuilder: ((context, index) {
                return ListTile(
                  leading: const CircleAvatar(
                        radius: 20.0,
                        backgroundImage: NetworkImage(
                            "https://www.kindpng.com/picc/m/24-248325_profile-picture-circle-png-transparent-png.png"),
                        backgroundColor: Colors.transparent,
                      ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Nama", style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w500),),
                      Text("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w500, color: const Color(0xff26B893)),),
                      const SizedBox(height: 8,),
                      Text("Time", style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w500),)
                    ],
                  ),
                  trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.delete, color: Colors.blue,)),
                );
              })
            ),
          );
        });
  }
}
