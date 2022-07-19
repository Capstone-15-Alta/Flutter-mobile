import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forum_diskusi/view/log/login_screen.dart';
import 'package:forum_diskusi/view/profil/edit_profile.dart';
import 'package:forum_diskusi/viewmodel/user_viewmodel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileTread extends StatefulWidget {
  const ProfileTread({Key? key}) : super(key: key);

  @override
  State<ProfileTread> createState() => _ProfileTreadState();
}

class _ProfileTreadState extends State<ProfileTread>
    with TickerProviderStateMixin {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UserViewModel>(context, listen: false).getDataUser();
      _tabController = TabController(length: 4, vsync: this);
    });
    super.initState();
  }

  final double backgroungImageHeight = 150;
  final double profileImageHeight = 80;
  final double shadeProfileImage = 100;
  final double positionedLeftImage = 10;

  TabController? _tabController;

  TextEditingController namaAwalController = TextEditingController();
  TextEditingController namaAkhirController = TextEditingController();

  TextEditingController nomorHandphoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController tanggalLahirController = TextEditingController();
  TextEditingController tingkatPendidikanlController = TextEditingController();

  TextEditingController negaraController = TextEditingController();
  TextEditingController kotaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserViewModel profileProvider = Provider.of<UserViewModel>(context);
    final top = backgroungImageHeight - shadeProfileImage / 2;
    final topForName = backgroungImageHeight - positionedLeftImage;
    final leftForName = shadeProfileImage + positionedLeftImage * 2;

    if (profileProvider.listDataUser == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      floatingActionButton: DraggableFab(
        child: FloatingActionButton(
          backgroundColor: const Color(0xff26B893),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: MediaQuery.of(context).size.height / 4,
                      color: Colors.white,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.warning_amber_outlined,
                                color: Colors.red, size: 40),
                            Text(
                              "Apakah anda ingin logout?",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xff26B893)),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: const Color(0xff26B893)),
                                    onPressed: () async {
                                      SharedPreferences pref =
                                          await SharedPreferences.getInstance();
                                      pref.clear();
                                      Navigator.of(context).pushReplacement(
                                          PageRouteBuilder(pageBuilder:
                                              (context, animation,
                                                  secondaryAnimation) {
                                        return const LoginScreen();
                                      }, transitionsBuilder: (context,
                                              animation,
                                              secondaryAnimation,
                                              child) {
                                        final tween =
                                            Tween(begin: 0.0, end: 2.0);
                                        return FadeTransition(
                                          opacity: animation.drive(tween),
                                          child: child,
                                        );
                                      }));
                                    },
                                    child: const Text("Lanjutkan")),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.red[700]),
                                  onPressed: () {
                                    Navigator.of(context, rootNavigator: true)
                                        .pop();
                                  },
                                  child: const Text("Batal"),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                });
          },
          child: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.all(16),
                  child: Center(
                      child: SvgPicture.asset(
                    "assets/image/logo.svg",
                    height: 35,
                    width: 35,
                  ))),
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.centerLeft,
                children: [
                  backGroundImage(),
                  Positioned(
                    child: profileImage(),
                    top: top,
                  ),
                  Positioned(
                      top: topForName,
                      left: leftForName,
                      child: profileName(profileProvider)),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              profileEditButton(profileProvider),
              SizedBox(
                height: profileImageHeight - 60,
              ),
              // editProfile(),
              buttonPMPT(profileProvider),
              const SizedBox(
                height: 10,
              ),
              Container(
                  margin: const EdgeInsets.all(16),
                  child: allMyTread(profileProvider))
            ],
          ),
        ),
      ),
    );
  }

  Widget backGroundImage() {
    return Stack(
      children: [
        SizedBox(
            width: double.infinity,
            height: backgroungImageHeight,
            child: Image(
              image: const NetworkImage(
                "https://wallpaperaccess.com/full/17353.jpg",
              ),
              width: double.infinity,
              height: backgroungImageHeight,
              fit: BoxFit.cover,
            )),
        Container(
          alignment: Alignment.topLeft,
          width: 130,
          child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      side: BorderSide(color: Color(0xff26B893)))),
              onPressed: () {},
              icon: const Icon(
                Icons.camera_alt_sharp,
                color: Color(0xff26B893),
              ),
              label: Text(
                "Ganti Cover",
                style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff26B893)),
              )),
        ),
      ],
    );
  }

  Widget profileImage() {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Container(
              height: shadeProfileImage,
              width: shadeProfileImage,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xff26B893)),
            ),
          ),
          Center(
            child: Container(
              height: profileImageHeight,
              width: profileImageHeight,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Widget profileName(UserViewModel name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(name.listDataUser!.username!,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: Colors.black)),
            Text(
              name.listDataUser!.email!,
              style: GoogleFonts.poppins(
                  fontSize: 11, color: const Color(0xff26B893)),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ],
    );
  }

  Widget profileEditButton(UserViewModel name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(" ",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 13,
                color: Colors.black)),
        const SizedBox(
          width: 20,
        ),
        Container(
          margin: const EdgeInsets.only(right: 10),
          height: 35,
          width: 90,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      side: BorderSide(color: Color(0xff26B893)))),
              onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                  return const ProfileEdit();
                }, transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                  final tween = Tween(begin: 0.0, end: 2.0);
                  return FadeTransition(
                    opacity: animation.drive(tween),
                    child: child,
                  );
                }));
              },
              child: Text(
                "Edit Profile",
                style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.center,
              )),
        ),
      ],
    );
  }

  Widget buttonPMPT(UserViewModel count) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.56,
      width: double.maxFinite,
      child: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            TabBar(controller: _tabController, tabs: [
              Tab(
                child: Column(
                  children: [
                    Text(
                      "Pengikut",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      count.listDataUser!.totalUserFollowers!.toString(),
                      // "2",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              Tab(
                child: Column(
                  children: [
                    Text(
                      "Mengikuti",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      count.listDataUser!.totalUserFollowing!.toString(),
                      // "1",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              Tab(
                child: Column(
                  children: [
                    Text(
                      "Post",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      count.listDataUser!.totalPostComments!.toString(),
                      // "3",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              Tab(
                child: Column(
                  children: [
                    Text(
                      "Thread",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      count.listDataUser!.totalThreads.toString(),
                      // "4",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ]),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.66,
                width: double.infinity,
                child: TabBarView(controller: _tabController, children: [
                  allMyFollowers(count),
                  allMyFollowed(count),
                  allMyPost(count),
                  allMyTread(count),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget allMyTread(UserViewModel threads) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.46,
      width: MediaQuery.of(context).size.width * 2,
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: threads.listDataUser!.threads!.length,
        itemBuilder: (context, index) {
          if (threads.listDataUser!.threads == null) {
            return Column(
              children: [
                Center(
                  child: Text(
                    "Belum ada Thread, Buat Thread sekarang yuk",
                    style: GoogleFonts.poppins(
                        color: const Color(0xff26B893),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 13.0),
                          shape: const StadiumBorder(),
                          side: const BorderSide(color: Color(0xff26B893)),
                          primary: Colors.white),
                      onPressed: () {},
                      child: Row(
                        children: [
                          const Icon(
                            FeatherIcons.feather,
                            color: Color(0xff26B893),
                          ),
                          Text("Buat Thread",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: const Color(0xff26B893),
                              ))
                        ],
                      )),
                ),
              ],
            );
          }
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
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
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
                                threads.listDataUser!.username!.toString(),
                                // "Nama",
                                style: GoogleFonts.poppins(fontSize: 14),
                              ),
                              Text(
                                // "Albert Flores@gmail.com",
                                threads.listDataUser!.email!.toString(),
                                style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    color: const Color(0xff26B893)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        // "Albert Flores@gmail.com",
                        threads.listDataUser!.threads?[index].title ?? "",
                        style: GoogleFonts.poppins(
                            fontSize: 13, color: const Color(0xff455154)),
                      ),
                      Text(
                        // "Pixel Buds Pro : Apakah Mampu Melawan AirPods Pro ? ",
                        threads.listDataUser!.threads?[index].description ?? "",
                        style: GoogleFonts.poppins(
                            fontSize: 13, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.favorite_border,
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
                ),
              )
            ],
          ));
        },
      ),
    );
  }

  Widget allMyPost(UserViewModel threads) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.46,
      width: MediaQuery.of(context).size.width * 2,
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: threads.listDataUser!.comments!.length,
        itemBuilder: (context, index) {
          if (threads.listDataUser!.comments == null) {
            return Column(
              children: [
                Center(
                  child: Text(
                    "Belum ada Post, Buat Thread sekarang yuk",
                    style: GoogleFonts.poppins(
                        color: const Color(0xff26B893),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 13.0),
                          shape: const StadiumBorder(),
                          side: const BorderSide(color: Color(0xff26B893)),
                          primary: Colors.white),
                      onPressed: () {},
                      child: Row(
                        children: [
                          const Icon(
                            FeatherIcons.feather,
                            color: Color(0xff26B893),
                          ),
                          Text("Buat Thread",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: const Color(0xff26B893),
                              ))
                        ],
                      )),
                ),
              ],
            );
          }
          return SizedBox(
              child: Row(
            children: [
              const SizedBox(
                  height: 40,
                  child: Image(
                    image: AssetImage("assets/image/Union.png"),
                  )),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.49,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            "Membalas thread ",
                            style: GoogleFonts.poppins(
                                fontSize: 11, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Text(
                        "${threads.listDataUser!.comments?[index]['created_at'] ?? ""}",
                        style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xffABABAB)),
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
                    child: Expanded(
                      child: Text(
                        "${threads.listDataUser!.comments?[index]['comment'] ?? ""}",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff455154),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ));
        },
      ),
    );
  }

  Widget allMyFollowed(UserViewModel threads) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.66,
      width: MediaQuery.of(context).size.width * 2,
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: threads.listDataUser!.userFollowing!.length,
        itemBuilder: (context, index) {
          if (threads.listDataUser?.userFollowing == null) {
            return Column(
              children: [
                Center(
                  child: Text(
                    "Belum ada mengikuti, Ayo mengikuti orang sekarang yuk",
                    style: GoogleFonts.poppins(
                        color: const Color(0xff26B893),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 13.0),
                          shape: const StadiumBorder(),
                          side: const BorderSide(color: Color(0xff26B893)),
                          primary: Colors.white),
                      onPressed: () {},
                      child: Row(
                        children: [
                          const Icon(
                            FeatherIcons.feather,
                            color: Color(0xff26B893),
                          ),
                          Text("Buat Thread",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: const Color(0xff26B893),
                              ))
                        ],
                      )),
                ),
              ],
            );
          }
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
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        threads.listDataUser!.userFollowing?[index]
                                ['user_followed']['username'] ??
                            "",
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            height: 30,
                            width: 75,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: const Color(0xff26B893))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Icon(
                                  Icons.add,
                                  color: Color(0xff26B893),
                                ),
                                Text(
                                  "Hapus",
                                  style: TextStyle(color: Color(0xff26B893)),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              )
            ],
          ));
        },
      ),
    );
  }

  Widget allMyFollowers(UserViewModel threads) {
    //if
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 16, right: 16),
      height: MediaQuery.of(context).size.height * 0.46,
      width: MediaQuery.of(context).size.width * 2,
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: threads.listDataUser!.userFollowers!.length,
        itemBuilder: (context, index) {
          if (threads.listDataUser!.userFollowers == null) {
            return Center(
              child: Text(
                "Belum ada followers",
                style: GoogleFonts.poppins(
                    color: const Color(0xff26B893),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            );
          }
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
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            threads.listDataUser!
                                .userFollowers![0]['user_follower']['username']
                                .toString(),
                            style: GoogleFonts.poppins(fontSize: 14),
                          ),
                          GestureDetector(
                              onTap: () {},
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                height: 30,
                                width: 75,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: const Color(0xff26B893))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Icon(
                                      Icons.add,
                                      color: Color(0xff26B893),
                                    ),
                                    Text(
                                      "Hapus",
                                      style:
                                          TextStyle(color: Color(0xff26B893)),
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ));
        },
      ),
    );
  }
}
