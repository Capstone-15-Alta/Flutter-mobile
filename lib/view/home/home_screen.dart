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

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  //   TabController? _tabController;
//   @override
//   void initState() {
//     _tabController = TabController(length: 3, vsync: this);
//     super.initState();
//   }
  // static const _filter = <String>['Terbaru', 'Trending', 'Kategori'];
  TabController? _tabController;
  // String _selectedFilter = 'Terbaru';

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
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
                  // const CircleAvatar(
                  //   radius: 23.0,
                  //   backgroundImage: NetworkImage(
                  //       "https://www.kindpng.com/picc/m/24-248325_profile-picture-circle-png-transparent-png.png"),
                  //   backgroundColor: Colors.transparent,
                  // )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.amber,
                  tabs: [
                    Tab(
                      child: Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border:
                                Border.all(color: Colors.redAccent)
                            ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text("Terkini"),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border:
                                Border.all(color: Colors.redAccent, width: 1)),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text("Trending"),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border:
                                Border.all(color: Colors.redAccent, width: 1)),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("hell"),
                        ),
                      ),
                    ),
                  ]),
              Container(
                width: double.maxFinite,
                height: 20,
                child: TabBarView(
                  controller: _tabController,
                  children: [Text("1234"), Text("4567"), Text("91011")],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
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
                                        threadProvider
                                            .listGetThread[index].user!.email!,
                                        style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            color: const Color(0xff26B893)),
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
                                width: MediaQuery.of(context).size.width * 0.66,
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



// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:forum_diskusi/view/home/home_thread.dart';
// import 'package:forum_diskusi/viewmodel/thread_viewModel.dart';
// import 'package:forum_diskusi/viewmodel/trendingThread_viewModel.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
//   //   TabController? _tabController;
// //   @override
// //   void initState() {
// //     _tabController = TabController(length: 3, vsync: this);
// //     super.initState();
// //   }
//   // static const _filter = <String>['Terbaru', 'Trending', 'Kategori'];
//   TabController? _tabController;
//   // String _selectedFilter = 'Terbaru';

//   @override
//   void initState() {
//     _tabController = TabController(length: 3, vsync: this);
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       Provider.of<ThreadViewModel>(context, listen: false).getAllThread();
//       Provider.of<TrendingTreadViewModel>(context, listen: false).getAllTrendingThread();
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final trendingThreadProvider = Provider.of<TrendingTreadViewModel>(context);
//     final threadProvider = Provider.of<ThreadViewModel>(context);
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           bottom: PreferredSize(
//                 preferredSize: Size.fromHeight(70),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Container(
//                     width: MediaQuery.of(context).size.width / 1.5,
//                     child: TabBar(
//                         unselectedLabelColor: Colors.blue,
//                         indicatorSize: TabBarIndicatorSize.label,
//                         indicator: BoxDecoration(
//                             borderRadius: BorderRadius.circular(50),
//                             color: Colors.blue),
//                         tabs: [
//                           Tab(
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(50),
//                                   border: Border.all(
//                                       color: Colors.blue, width: 1)),
//                               child: Align(
//                                 alignment: Alignment.center,
//                                 child: Text("Home"),
//                               ),
//                             ),
//                           ),
//                           Tab(
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(50),
//                                   border: Border.all(
//                                       color: Colors.blue, width: 1)),
//                               child: Align(
//                                 alignment: Alignment.center,
//                                 child: Text("Gallery"),
//                               ),
//                             ),
//                           ),
//                           Tab(
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(50),
//                                   border: Border.all(
//                                       color: Colors.blue, width: 1)),
//                               child: Align(
//                                 alignment: Alignment.center,
//                                 child: Text("Home"),
//                               ),
//                             ),
//                           ),
//                         ]),
//                   ),
//                 )),
//         ),
//         backgroundColor: Colors.white,
//         floatingActionButton: FloatingActionButton(
//           backgroundColor: const Color(0xff26B893),
//           onPressed: () {
//             Navigator.of(context).push(PageRouteBuilder(
//                 pageBuilder: (context, animation, secondaryAnimation) {
//               return const HomeThread();
//             }, transitionsBuilder:
//                     (context, animation, secondaryAnimation, child) {
//               final tween = Tween(begin: 0.0, end: 2.0);
//               return FadeTransition(
//                 opacity: animation.drive(tween),
//                 child: child,
//               );
//             }));
//           },
//           child: const Icon(
//             Icons.add,
//             color: Colors.white,
//           ),
//         ),
//         body: Container(
//           margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                   child: SvgPicture.asset(
//                 "assets/image/logo.svg",
//                 height: 35,
//                 width: 35,
//               )),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Text("Hello, Yogi",
//                           style: GoogleFonts.poppins(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 23,
//                               color: const Color(0xff26B893))),
//                       Text(
//                         "Apa yang ingin kamu baca hari ini?",
//                         style: GoogleFonts.poppins(fontSize: 13),
//                       ),
//                       const SizedBox(height: 20),
//                     ],
//                   ),
//                   // const CircleAvatar(
//                   //   radius: 23.0,
//                   //   backgroundImage: NetworkImage(
//                   //       "https://www.kindpng.com/picc/m/24-248325_profile-picture-circle-png-transparent-png.png"),
//                   //   backgroundColor: Colors.transparent,
//                   // )
//                 ],
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
              
//               Expanded(
//                 child: SizedBox(
//                   width: double.maxFinite,
//                   height: 200,
//                   child: TabBarView(
//                     controller: _tabController,
//                     children: [
                      
                      
                      


//                       Text("91011")],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               // Expanded(
//               //   child: ListView.separated(
//               //     separatorBuilder: (BuildContext context, int index) =>
//               //         const Divider(),
//               //     itemCount: threadProvider.listGetThread.length,
//               //     itemBuilder: (context, index) {
//               //       // List<ThreadModel> thread = [];
//               //       // if(data != isEmpty){
//               //       //  return "data kosong"
//               //       // }
//               //       return SizedBox(
//               //           child: Row(
//               //         mainAxisAlignment: MainAxisAlignment.start,
//               //         crossAxisAlignment: CrossAxisAlignment.start,
//               //         children: [
//               //           const CircleAvatar(
//               //             radius: 30.0,
//               //             backgroundImage: NetworkImage(
//               //                 "https://www.kindpng.com/picc/m/24-248325_profile-picture-circle-png-transparent-png.png"),
//               //             backgroundColor: Colors.transparent,
//               //           ),
//               //           const SizedBox(
//               //             width: 10,
//               //           ),
                        
//               //         ],
//               //       ));
//               //     },
//               //   ),
//               // )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }





// ListView.separated(
//                         separatorBuilder: (BuildContext context, int index) =>
//                             const Divider(),
//                         itemCount: trendingThreadProvider.listGetTrendingThread.length,
//                         itemBuilder: (context, index) {
//                           // List<ThreadModel> thread = [];
//                           // if(data != isEmpty){
//                           //  return "data kosong"
//                           // }
//                           return SizedBox(
//                               child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const CircleAvatar(
//                                 radius: 30.0,
//                                 backgroundImage: NetworkImage(
//                                     "https://www.kindpng.com/picc/m/24-248325_profile-picture-circle-png-transparent-png.png"),
//                                 backgroundColor: Colors.transparent,
//                               ),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               // "Nama"
//                                               trendingThreadProvider.listGetTrendingThread[index]
//                                                   .user!.username!,
//                                               style:
//                                                   GoogleFonts.poppins(fontSize: 14),
//                                             ),
//                                             Text(
//                                               // "Albert Flores@gmail.com",
//                                               trendingThreadProvider
//                                                   .listGetTrendingThread[index].user!.email!,
//                                               style: GoogleFonts.poppins(
//                                                   fontSize: 13,
//                                                   color: const Color(0xff26B893)),
//                                             ),
//                                           ],
//                                         ),
//                                         GestureDetector(
//                                             onTap: () {},
//                                             child: Container(
//                                               height: 30,
//                                               width: 75,
//                                               decoration: BoxDecoration(
//                                                 color: const Color(0xff26B893),
//                                                 borderRadius:
//                                                     BorderRadius.circular(10),
//                                               ),
//                                               child: Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.spaceEvenly,
//                                                 children: const [
//                                                   Icon(
//                                                     Icons.add,
//                                                     color: Colors.white,
//                                                   ),
//                                                   Text(
//                                                     "Ikuti",
//                                                     style: TextStyle(
//                                                         color: Colors.white),
//                                                   )
//                                                 ],
//                                               ),
//                                             ))
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       width: MediaQuery.of(context).size.width * 0.66,
//                                       child: Text(
//                                         // "Pixel Buds Pro : Apakah Mampu Melawan AirPods Pro ? ",
//                                         trendingThreadProvider
//                                             .listGetTrendingThread[index].description!,
//                                         style: GoogleFonts.poppins(
//                                             fontSize: 13,
//                                             fontWeight: FontWeight.w500),
//                                         textAlign: TextAlign.justify,
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 5,
//                                     ),
//                                     Text(
//                                       // "Time",
//                                       trendingThreadProvider.listGetTrendingThread[index].createdAt!,
//                                       style: GoogleFonts.poppins(fontSize: 14),
//                                     ),
//                                     Row(
//                                       children: [
//                                         IconButton(
//                                           icon: const Icon(
//                                             Icons.thumb_up_alt_outlined,
//                                             size: 18,
//                                             color: Color(0xff26B893),
//                                           ),
//                                           onPressed: () {},
//                                         ),
//                                         IconButton(
//                                           icon: const Icon(
//                                             Icons.thumb_down_alt_outlined,
//                                             size: 18,
//                                             color: Color(0xff26B893),
//                                           ),
//                                           onPressed: () {},
//                                         ),
//                                         IconButton(
//                                           icon: const Icon(Icons.chat,
//                                               size: 18, color: Color(0xff26B893)),
//                                           onPressed: () {},
//                                         ),
//                                         IconButton(
//                                           icon: const Icon(
//                                             Icons.remove_red_eye_outlined,
//                                             size: 18,
//                                             color: Color(0xff26B893),
//                                           ),
//                                           onPressed: () {},
//                                         ),
//                                         IconButton(
//                                           icon: const Icon(
//                                             Icons.arrow_back_outlined,
//                                             size: 18,
//                                             color: Color(0xff26B893),
//                                           ),
//                                           onPressed: () {},
//                                         ),
//                                         IconButton(
//                                           icon: const Icon(
//                                             Icons.share,
//                                             size: 18,
//                                             color: Color(0xff26B893),
//                                           ),
//                                           onPressed: () {},
//                                         ),
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ));
//                         },
//                       ),