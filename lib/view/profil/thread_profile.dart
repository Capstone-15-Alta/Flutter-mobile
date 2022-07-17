import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forum_diskusi/view/log/login_screen.dart';
import 'package:forum_diskusi/view/profil/edit_profile.dart';
import 'package:forum_diskusi/view/profil/profile_mengikuti.dart';
import 'package:forum_diskusi/view/profil/profile_post.dart';
import 'package:forum_diskusi/viewmodel/user_viewModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileTread extends StatefulWidget {
  const ProfileTread({Key? key}) : super(key: key);

  @override
  State<ProfileTread> createState() => _ProfileTreadState();
}

class _ProfileTreadState extends State<ProfileTread> {
  // bool isInit = true;

  // @override
  // void didChangeDependencies() {
  //   Provider.of<UserViewModel>(context).listDataUser;
  //   super.didChangeDependencies();
  // }
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UserViewModel>(context, listen: false).getDataUser();
    });
    super.initState();
  }

  final double backgroungImageHeight = 150;
  final double profileImageHeight = 80;
  final double shadeProfileImage = 100;
  final double positionedLeftImage = 10;

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
                  shape: BoxShape.circle, color: Colors.black),
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
            Text(
                // "Muhammad Yogi",
                name.listDataUser!.username!,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: Colors.black)),
            Text(
              // "Muhamadyogi413@gmail.com",
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
        SizedBox(
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
    return Container(
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: () {},
              child: Center(
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
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      count.listDataUser!.totalUserFollowers!.toString(),
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                  return const ProfileMengikuti();
                }, transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                  final tween = Tween(begin: 0.0, end: 2.0);
                  return FadeTransition(
                    opacity: animation.drive(tween),
                    child: child,
                  );
                }));
              },
              child: Center(
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
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      count.listDataUser!.totalUserFollowing!.toString(),
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )),
          TextButton(
              onPressed: () async {
                Navigator.of(context).pushReplacement(PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                  return const ProfilePost();
                }, transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                  final tween = Tween(begin: 0.0, end: 2.0);
                  return FadeTransition(
                    opacity: animation.drive(tween),
                    child: child,
                  );
                }));
              },
              child: Center(
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
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      count.listDataUser!.totalPostComments!.toString(),
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )),
          TextButton(
              onPressed: () {},
              child: Center(
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
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      count.listDataUser!.totalThreads.toString(),
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget allMyTread(UserViewModel threads) {
    //if
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.46,
      width: MediaQuery.of(context).size.width * 2,
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: threads.listDataUser!.threads!.length,
        itemBuilder: (context, index) {
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                ),
              )
            ],
          ));
        },
      ),
    );
  }
}
