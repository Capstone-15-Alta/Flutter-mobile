import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forum_diskusi/model/list_dropdown.dart';
import 'package:forum_diskusi/view/home/home_thread.dart';
import 'package:forum_diskusi/viewmodel/kategori_viewModel.dart';
import 'package:forum_diskusi/viewmodel/thread_viewModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const _filter = <String>['Terbaru', 'Trending', 'Kategori'];

  String _selectedFilter = 'Terbaru';
  
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff26B893),
          onPressed: () {
            Navigator.of(context).pushReplacement(PageRouteBuilder(
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
                  const CircleAvatar(
                    radius: 23.0,
                    backgroundImage: NetworkImage(
                        "https://www.kindpng.com/picc/m/24-248325_profile-picture-circle-png-transparent-png.png"),
                    backgroundColor: Colors.transparent,
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              // ElevatedButton(onPressed: (){
              //   threadProvider.getAllThread();
              // }, child: Text("Test")),
              SizedBox(
                height: 35,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ..._filter.map((filterText) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: SizedBox(
                          width: 130,
                          child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  primary: _selectedFilter == filterText
                                      ? const Color(0xff26B893)
                                      : Colors.white,
                                  onPrimary: _selectedFilter == filterText
                                      ? Colors.white
                                      : const Color(0xff26B893),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      side: BorderSide(
                                          color: Color(0xff26B893)))),
                              onPressed: () {
                                return setState(
                                    () => _selectedFilter = filterText);
                              },
                              icon: const Icon(Icons.access_time_sharp),
                              label: Text(
                                filterText,
                                style: GoogleFonts.poppins(fontSize: 15),
                              )),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
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
                              "https://www.kindpng.com/picc/m/24-248325_profile-picture-circle-png-transparent-png.png"
                          ),
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        // "Nama"
                                        threadProvider.listGetThread[index].user!.username!
                                        ,
                                        style: GoogleFonts.poppins(fontSize: 14),
                                      ),
                                      Text(
                                        // "Albert Flores@gmail.com",
                                        threadProvider.listGetThread[index].user!.email!,
                                        style: GoogleFonts.poppins(
                                            fontSize: 13, color: const Color(0xff26B893)),
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        height: 30,
                                        width: 75,
                                        decoration: BoxDecoration(
                                          color: const Color(0xff26B893),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: const [
                                            Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              "Ikuti",
                                              style: TextStyle(color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.66,
                                child: Text(
                                  // "Pixel Buds Pro : Apakah Mampu Melawan AirPods Pro ? ",
                                  threadProvider.listGetThread[index].description!,
                                  style: GoogleFonts.poppins(
                                      fontSize: 13, fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                // "Time",
                                threadProvider.listGetThread[index].createdAt!,
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
              )
            ],
          ),
        ),
      ),
    );
  }

}
