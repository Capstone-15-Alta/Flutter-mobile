import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forum_diskusi/utils/finite_state.dart';
import 'package:forum_diskusi/view/component/button_onThread.dart';
import 'package:forum_diskusi/view/home/home_thread.dart';
import 'package:forum_diskusi/viewmodel/kategori_viewModel.dart';
import 'package:forum_diskusi/viewmodel/thread_viewModel.dart';
import 'package:forum_diskusi/viewmodel/user_viewModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  bool isFollowing = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ThreadViewModel>(context, listen: false).getAllThread();
      Provider.of<UserViewModel>(context, listen: false).getDataUser();
      dropDownKategori(context);
    });
    super.initState();
  }

  Widget dropDownKategori(BuildContext context) {
    final kategoriProvider =
        Provider.of<KategoriViewModel>(context, listen: false);

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
      child: Consumer<KategoriViewModel>(builder: (context, model, _) {
        return Container(
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
              value: model.selectedKategori,
              onChanged: (String? value) {
                model.changeKategori(value!);
                final threadProvider =
                    Provider.of<ThreadViewModel>(context, listen: false);
                threadProvider.getThreadByCategory(category: value);
              },
              items: model.listKategori!.data!
                  .map(
                    (e) => DropdownMenuItem<String>(
                      value: e.categoryName,
                      child: Text(e.categoryName!),
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final threadProvider = Provider.of<ThreadViewModel>(context, listen: false);
    final userProvider = Provider.of<UserViewModel>(context);
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
                        Text("Hello, ${userProvider.listDataUser?.username}",
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
                    const CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                          "https://www.kindpng.com/picc/m/24-248325_profile-picture-circle-png-transparent-png.png"),
                      backgroundColor: Colors.transparent,
                    ),
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
                                  side: BorderSide(color: Color(0xff26B893)))),
                          onPressed: () {
                            setState(
                              () {
                                if (_hasBeenPressedButton1 == false ||
                                    _hasBeenPressedButton2 == true ||
                                    _hasBeenPressedButton3 == true) {
                                  _hasBeenPressedButton1 = true;
                                  _hasBeenPressedButton2 = false;
                                  _hasBeenPressedButton3 = false;
                                }
                                threadProvider.getAllThread();
                              },
                            );
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
                          ),
                        ),
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
                                threadProvider.getAllTrendingThread();
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
                      dropDownKategori(context),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.62,
                  child:
                      Consumer<ThreadViewModel>(builder: (context, model, _) {
                    switch (model.myState) {
                      case MyState.initial:
                        return const SizedBox();
                      case MyState.loading:
                        return const CircularProgressIndicator();
                      case MyState.success:
                        return ListView.separated(
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                          itemCount: model.listGetThread.length,
                          itemBuilder: (context, index) {
                            final thread = model.listGetThread[index];
                            return ButtonWidget(
                              thread: thread,
                              id: thread.id,
                            );
                          },
                        );
                      case MyState.failed:
                        return const Text("oops, Something Went Wrong");
                    }
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
