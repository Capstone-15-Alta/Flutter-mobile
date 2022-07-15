import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forum_diskusi/model/api/ranking_api.dart';
import 'package:forum_diskusi/model/api/thread_api.dart';
import 'package:forum_diskusi/view/comments/comments_screen.dart';
import 'package:forum_diskusi/view/home/home_thread.dart';
import 'package:forum_diskusi/viewmodel/kategori_viewModel.dart';
import 'package:forum_diskusi/viewmodel/thread_viewModel.dart';
import 'package:forum_diskusi/viewmodel/trendingThread_viewModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../notifikasi/notifikasi_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  bool _hasBeenPressedButton1 = false;
  bool _hasBeenPressedButton2 = false;
  bool _hasBeenPressedButton3 = false;
  String? selectedValue;
  String kategori = '';

  // var items = [
  //   'Item 1',
  //   'Item 2',
  //   'Item 3',
  //   'Item 4',
  //   'Item 5',
  // ];

  bool isFollowing = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ThreadViewModel>(context, listen: false).getAllThread();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final threadProvider = Provider.of<KategoriViewModel>(context);
    final threadProvider = Provider.of<ThreadViewModel>(context);
    final trendingThreadProvider = Provider.of<TrendingTreadViewModel>(context);
    final kategoriProvider = Provider.of<KategoriViewModel>(context);

    Widget dropDownKategori() {
      if (kategoriProvider.listKategori == null ||
          kategoriProvider.listKategori!.data == null) {
        kategoriProvider.getKategori();
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return Container(
        height: MediaQuery.of(context).size.height * 0.052,
        width: MediaQuery.of(context).size.width * 0.37,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            border: Border.all(
                color: const Color(0xff26B893),
                style: BorderStyle.solid,
                width: 0.8)),
        child: Container(
          margin: const EdgeInsets.all(8),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              // isExpanded: true,
              isDense: true,
              hint: Row(
                children: [
                  const Icon(
                    Icons.view_comfortable_rounded,
                    color: Color(0xff26B893),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Text(
                    "Kategori",
                    style: GoogleFonts.poppins(
                        fontSize: 13, color: const Color(0xff26B893)),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              value: selectedValue,
              onChanged: (String? value) {
                setState(() {
                  selectedValue = value ?? "";
                  kategori = selectedValue!;
                  print(selectedValue);
                });
              },
              items: kategoriProvider.listKategori!.data!
                  .map((e) => DropdownMenuItem<String>(
                      value: e.categoryName, child: Text(e.categoryName!)))
                  .toList(),
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          floatingActionButton: DraggableFab(
            child: FloatingActionButton(
              backgroundColor: const Color(0xff26B893),
              onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                  return const HomeThread();
                }, transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                  final tween = Tween(begin: 0.0, end: 2.0);
                  return FadeTransition(
                    opacity: animation.drive(tween),
                    child: child,
                  );
                }));
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
          body: Container(
            margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: SvgPicture.asset(
                  "assets/image/logo.svg",
                  height: 35,
                  width: 35,
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text("Hello, Yogi",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                                color: const Color(0xff26B893))),
                        Text(
                          "Apa yang ingin kamu baca hari ini?",
                          style: GoogleFonts.poppins(fontSize: 13),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                            return const NotifScreen();
                          }, transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                            final tween = Tween(begin: 0.0, end: 2.0);
                            return FadeTransition(
                              opacity: animation.drive(tween),
                              child: child,
                            );
                          }));
                        },
                        icon: const Icon(
                          Icons.notifications,
                          color: Color(0xff26B893),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.052,
                        width: MediaQuery.of(context).size.width * 0.37,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: _hasBeenPressedButton1
                                    ? const Color(0xff26B893)
                                    : Colors.white,
                                onPrimary: _hasBeenPressedButton1
                                    ? Colors.white
                                    : const Color(0xff26B893),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    side:
                                        BorderSide(color: Color(0xff26B893)))),
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(Icons.access_time),
                                Text(
                                  "Semua",
                                  style: GoogleFonts.poppins(fontSize: 13),
                                ),
                              ],
                            )),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.052,
                        width: MediaQuery.of(context).size.width * 0.37,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: _hasBeenPressedButton2
                                    ? const Color(0xff26B893)
                                    : Colors.white,
                                onPrimary: _hasBeenPressedButton2
                                    ? Colors.white
                                    : const Color(0xff26B893),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    side:
                                        BorderSide(color: Color(0xff26B893)))),
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(Icons.north_east_outlined),
                                Text(
                                  "Trending",
                                  style: GoogleFonts.poppins(fontSize: 13),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            )),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      dropDownKategori()
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.62,
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemCount: threadProvider.listGetThread.length,
                    itemBuilder: (context, index) {
                      // List<ThreadModel> thread = [];
                      // if(data != isEmpty){
                      //  return "data kosong"
                      // }
                      return SizedBox(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                                "https://www.kindpng.com/picc/m/24-248325_profile-picture-circle-png-transparent-png.png"),
                            backgroundColor: Colors.transparent,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          // "Nama"
                                          threadProvider.listGetThread[index]
                                              .user!.username!,
                                          style:
                                              GoogleFonts.poppins(fontSize: 14),
                                        ),
                                        Text(
                                          // "Albert Flores@gmail.com",
                                          threadProvider.listGetThread[index]
                                              .user!.email!,
                                          style: GoogleFonts.poppins(
                                              fontSize: 13,
                                              color: const Color(0xff26B893)),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {});
                                        },
                                        child: AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          height: 30,
                                          width: 75,
                                          decoration: BoxDecoration(
                                            color: const Color(0xff26B893),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: const [
                                              Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                "Ikuti",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.66,
                                  child: Text(
                                    // "Pixel Buds Pro : Apakah Mampu Melawan AirPods Pro ? ",
                                    threadProvider
                                        .listGetThread[index].description!,
                                    style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  // "Time",
                                  threadProvider
                                      .listGetThread[index].createdAt!,
                                  style: GoogleFonts.poppins(fontSize: 14),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.thumb_up_alt_outlined,
                                        size: 18,
                                        color: Color(0xff26B893),
                                      ),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.thumb_down_alt_outlined,
                                        size: 18,
                                        color: Color(0xff26B893),
                                      ),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.chat,
                                          size: 18, color: Color(0xff26B893)),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.remove_red_eye_outlined,
                                        size: 18,
                                        color: Color(0xff26B893),
                                      ),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.arrow_back_outlined,
                                        size: 18,
                                        color: Color(0xff26B893),
                                      ),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.share,
                                        size: 18,
                                        color: Color(0xff26B893),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
