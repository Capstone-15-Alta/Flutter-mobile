import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:forum_diskusi/model/thread_postModel.dart';
import 'package:forum_diskusi/view/home/home_nav.dart';
import 'package:forum_diskusi/viewmodel/kategori_viewmodel.dart';
import 'package:forum_diskusi/viewmodel/thread_viewmodel.dart';
import 'package:forum_diskusi/viewmodel/user_viewmodel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeThread extends StatefulWidget {
  const HomeThread({Key? key}) : super(key: key);

  @override
  State<HomeThread> createState() => _HomeThreadState();
}

class _HomeThreadState extends State<HomeThread> {
  String? selectedValue;
  final kategoriEditingController = TextEditingController();
  String kategori = '';
  final juduldescriptionEditingController = TextEditingController();
  String judul = '';
  final descriptionEditingController = TextEditingController();
  String description = '';

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UserViewModel>(context, listen: false).getDataUser();
      Provider.of<KategoriViewModel>(context, listen: false).getKategori();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserViewModel profileProvider = Provider.of<UserViewModel>(context);
    final kategoriProvider = Provider.of<KategoriViewModel>(context);
    final postProvider = Provider.of<ThreadViewModel>(context);

    final judulField = SizedBox(
        child: TextFormField(
      controller: juduldescriptionEditingController,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        fillColor: Color.fromARGB(255, 236, 240, 243),
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Isi Judul Thread Disini",
      ),
      onChanged: (String value) {
        judul = value;
      },
    ));

    final descriptionField = SizedBox(
        child: TextField(
      controller: descriptionEditingController,
      maxLines: 8,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        fillColor: Color.fromARGB(255, 236, 240, 243),
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Isi Yang Ingin Anda Diskusikan?",
      ),
      onChanged: (String value) {
        description = value;
      },
    ));

    final kembaliButton = Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      child: MaterialButton(
        minWidth: 50,
        onPressed: () async {
          Navigator.pop(context);
        },
        child: Text(
          "Kembali",
          style: GoogleFonts.poppins(
            color: const Color(0xff26B893),
            fontSize: 14,
          ),
        ),
      ),
    );

    final postingButton = Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(10),
      color: const Color(0xff26B893),
      child: MaterialButton(
        minWidth: 50,
        onPressed: () async {
          try {
            await Future.delayed(const Duration(seconds: 2))
                .then((value) async {
                  postProvider.postThread(ThreadPostModel(
                      category_id:
                          kategoriProvider.kategoriFilter![0].id!.toInt(),
                      title: juduldescriptionEditingController.text,
                      description: descriptionEditingController.text));
                })
                .then((value) => Fluttertoast.showToast(msg: "Posting Sukses"))
                .then((value) => Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return const HomeNav();
                        },
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          final tween = Tween(begin: 0.0, end: 2.0);
                          return FadeTransition(
                            opacity: animation.drive(tween),
                            child: child,
                          );
                        },
                      ),
                    ));
          } catch (e) {
            Fluttertoast.showToast(msg: "Posting Gagal");
          }
        },
        child: Text(
          "Posting",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );

    Widget dropDownKategori() {
      if (kategoriProvider.listKategori == null ||
          kategoriProvider.listKategori!.data == null) {
        kategoriProvider.getKategori();
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      return DropdownButtonHideUnderline(
          child: DropdownButton(
              // isExpanded: true,
              isDense: true,
              hint: const Text("Pilih Kategori"),
              value: selectedValue,
              onChanged: (String? value) {
                setState(() {
                  selectedValue = value ?? "";
                  kategori = selectedValue!;

                  kategoriProvider.filterKategoriId(kategori);
                });
              },
              items: kategoriProvider.listKategori!.data!
                  .map((e) => DropdownMenuItem<String>(
                      value: e.categoryName, child: Text(e.categoryName!)))
                  .toList()));
    }

    if (profileProvider.listDataUser == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Column(
              children: [
                SvgPicture.asset(
                  "assets/image/logo.svg",
                  height: 35,
                  width: 35,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Text("Thread",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                                color: const Color(0xff26B893))),
                        Text(
                          "Ayo buat tread yang ingin kamu\nbagikan hari ini?",
                          style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff26B893)),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                    const CircleAvatar(
                      radius: 23.0,
                      backgroundImage: NetworkImage(
                          "https://www.kindpng.com/picc/m/24-248325_profile-picture-circle-png-transparent-png.png"),
                      backgroundColor: Colors.transparent,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 17.0,
                              backgroundImage: NetworkImage(
                                  "https://www.kindpng.com/picc/m/24-248325_profile-picture-circle-png-transparent-png.png"),
                              backgroundColor: Colors.transparent,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          profileProvider
                                              .listDataUser!.username!,
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          profileProvider.listDataUser!.email!,
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10,
                                              color: const Color(0xff26B893)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        border: Border.all(
                                            color: Colors.red,
                                            style: BorderStyle.solid,
                                            width: 0.80),
                                      ),
                                      child: Container(
                                          margin: const EdgeInsets.all(8),
                                          child: dropDownKategori()))
                                ],
                              ),
                            ),
                            // kategoriField
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: Colors.black,
                        height: 2,
                      ),
                      judulField,
                      descriptionField
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    kembaliButton,
                    const SizedBox(
                      width: 15,
                    ),
                    postingButton,
                  ],
                ),
              ],
            )),
      )),
    );
  }
}
