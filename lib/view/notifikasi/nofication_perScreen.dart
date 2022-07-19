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
  bool _hasBeenPressedButton4 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
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
                            _hasBeenPressedButton3 == true ||
                            _hasBeenPressedButton4 == true) {
                          _hasBeenPressedButton1 = true;
                          _hasBeenPressedButton2 = false;
                          _hasBeenPressedButton3 = false;
                          _hasBeenPressedButton4 = false;
                        }
                      });
                    },
                    child: Text(
                      "Semua",
                      style: GoogleFonts.poppins(fontSize: 13),
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
                        onPrimary: _hasBeenPressedButton2
                            ? Colors.white
                            : const Color(0xff26B893),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            side: BorderSide(color: Color(0xff26B893)))),
                    onPressed: () {
                      setState(() {
                        if (_hasBeenPressedButton1 == true ||
                            _hasBeenPressedButton2 == false ||
                            _hasBeenPressedButton3 == true ||
                            _hasBeenPressedButton4 == true) {
                          _hasBeenPressedButton2 = true;
                          _hasBeenPressedButton1 = false;
                          _hasBeenPressedButton3 = false;
                          _hasBeenPressedButton4 = false;
                        }
                      });
                    },
                    child: Text(
                      "Belum\nDibaca",
                      style: GoogleFonts.poppins(fontSize: 13),
                      textAlign: TextAlign.center,
                    )),
              ),
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: _hasBeenPressedButton3
                            ? const Color(0xff26B893)
                            : Colors.white,
                        onPrimary: _hasBeenPressedButton3
                            ? Colors.white
                            : const Color(0xff26B893),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            side: BorderSide(color: Color(0xff26B893)))),
                    onPressed: () {
                      setState(() {
                        if (_hasBeenPressedButton1 == true ||
                            _hasBeenPressedButton2 == true ||
                            _hasBeenPressedButton3 == false ||
                            _hasBeenPressedButton4 == true) {
                          _hasBeenPressedButton4 = false;
                          _hasBeenPressedButton3 = true;
                          _hasBeenPressedButton2 = false;
                          _hasBeenPressedButton1 = false;
                        }
                      });
                    },
                    child: Text(
                      "Baca\nSemuanya",
                      style: GoogleFonts.poppins(fontSize: 13),
                      textAlign: TextAlign.center,
                    )),
              ),
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: _hasBeenPressedButton4
                            ? const Color(0xff26B893)
                            : Colors.white,
                        onPrimary: _hasBeenPressedButton4
                            ? Colors.white
                            : const Color(0xff26B893),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            side: BorderSide(color: Color(0xff26B893)))),
                    onPressed: () {
                      setState(() {
                        if (_hasBeenPressedButton1 == true ||
                            _hasBeenPressedButton2 == true ||
                            _hasBeenPressedButton3 == true ||
                            _hasBeenPressedButton4 == false) {
                          _hasBeenPressedButton4 = true;
                          _hasBeenPressedButton3 = false;
                          _hasBeenPressedButton2 = false;
                          _hasBeenPressedButton1 = false;
                        }
                      });
                    },
                    child: Text(
                      "Hapus\nSemuanya",
                      style: GoogleFonts.poppins(fontSize: 13),
                      textAlign: TextAlign.center,
                    )),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.57,
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
          return Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 20.0,
                    backgroundImage: NetworkImage(
                        "https://www.kindpng.com/picc/m/24-248325_profile-picture-circle-png-transparent-png.png"),
                    backgroundColor: Colors.transparent,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.65,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                "EmmaRiver01 membalas komentar anda",
                                style: GoogleFonts.poppins(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete,
                                color: Color(0xffE11D4C),
                              )),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Text(
                          "Menurut pendapat saya bahwa bukan cacing, tetapi kutu adalah penemuan paling kontroversial dalam sejarahMenurut pendapat saya bahwa bukan cacing, tetapi kutu adalah penemuan paling kontroversial dalam sejarah",
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff455154),
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Minggu, 22 Juni 2022",
                        style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xffABABAB)),
                      )
                    ],
                  ),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 20.0,
                    backgroundImage: NetworkImage(
                        "https://www.kindpng.com/picc/m/24-248325_profile-picture-circle-png-transparent-png.png"),
                    backgroundColor: Colors.transparent,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.65,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                "AlexBrown membalas komentar anda",
                                style: GoogleFonts.poppins(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete,
                                color: Color(0xffE11D4C),
                              )),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Text(
                          "Kutu adalah serangga yang hidup sebagai parasit pada inang yang berdarah panas, salah satunya manusia. Kutu biasanya menghabiskan hidup mereka di satu inang dan bertelur banyak",
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff455154),
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Minggu, 22 Juni 2022",
                        style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xffABABAB)),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 20.0,
                    backgroundImage: NetworkImage(
                        "https://www.kindpng.com/picc/m/24-248325_profile-picture-circle-png-transparent-png.png"),
                    backgroundColor: Colors.transparent,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.65,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                "Ana2007 Mulai Mengikuti anda",
                                style: GoogleFonts.poppins(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete,
                                color: Color(0xffE11D4C),
                              )),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Text(
                          "",
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff455154),
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Minggu, 22 Juni 2022",
                        style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xffABABAB)),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 20.0,
                    backgroundImage: NetworkImage(
                        "https://www.kindpng.com/picc/m/24-248325_profile-picture-circle-png-transparent-png.png"),
                    backgroundColor: Colors.transparent,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.65,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                "AlexBrown membalas komentar anda",
                                style: GoogleFonts.poppins(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete,
                                color: Color(0xffE11D4C),
                              )),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Text(
                          "Kutu adalah serangga yang hidup sebagai parasit pada inang yang berdarah panas, salah satunya manusia. Kutu biasanya menghabiskan hidup mereka di satu inang dan bertelur banyak",
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff455154),
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Minggu, 22 Juni 2022",
                        style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xffABABAB)),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(),
            ],
          );
          // return ListTile(
          // leading: const CircleAvatar(
          //   radius: 20.0,
          //   backgroundImage: NetworkImage(
          //       "https://www.kindpng.com/picc/m/24-248325_profile-picture-circle-png-transparent-png.png"),
          //   backgroundColor: Colors.transparent,
          // ),
          // title: Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Row(
          //       children: [
          //         SizedBox(
          //           width: MediaQuery.of(context).size.width * 0.57,
          //           child: SingleChildScrollView(
          //             scrollDirection: Axis.horizontal,
          //             child: Text(
          //               "EmmaRiver01 membalas komentar anda",
          //               style: GoogleFonts.poppins(
          //                   fontSize: 12, fontWeight: FontWeight.w500),
          //             ),
          //           ),
          //         ),
          //         IconButton(
          //             onPressed: () {},
          //             icon: const Icon(
          //               Icons.delete,
          //               color: Color(0xffE11D4C),
          //             )),
          //       ],
          //     ),
          //     Text(
          //       "Menurut pendapat saya bahwa bukan cacing, tetapi kutu adalah penemuan paling kontroversial dalam sejarahMenurut pendapat saya bahwa bukan cacing, tetapi kutu adalah penemuan paling kontroversial dalam sejarah",
          //       style: GoogleFonts.poppins(
          //         fontSize: 13,
          //         fontWeight: FontWeight.w500,
          //         color: const Color(0xff455154),
          //       ),
          //       textAlign: TextAlign.justify,
          //     ),
          //     const SizedBox(
          //       height: 8,
          //     ),
          //     Text(
          //       "Minggu, 22 Juni 2022",
          //       style: GoogleFonts.poppins(
          //           fontSize: 13,
          //           fontWeight: FontWeight.w500,
          //           color: const Color(0xffABABAB)),
          //     )
          //   ],
          // ),
          // );
        });
  }
}
