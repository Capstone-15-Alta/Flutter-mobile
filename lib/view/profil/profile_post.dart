import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePost extends StatefulWidget {
  const ProfilePost({Key? key}) : super(key: key);

  @override
  State<ProfilePost> createState() => _ProfilePostState();
}

class _ProfilePostState extends State<ProfilePost> {
  final double backgroungImageHeight = 150;
  final double profileImageHeight = 80;
  final double shadeProfileImage = 100;
  final double positionedLeftImage = 10;

  @override
  Widget build(BuildContext context) {
    final top = backgroungImageHeight - shadeProfileImage / 2;
    final topForName = backgroungImageHeight - positionedLeftImage;
    final leftForName = shadeProfileImage + positionedLeftImage * 2;
    return Scaffold(
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
                      top: topForName, left: leftForName, child: profileName()),
                ],
              ),
              SizedBox(
                height: profileImageHeight - 30,
              ),
              buttonPMPT(),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              notifikasiProfile()
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

  Widget profileName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text("Muhammad Yogi",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: Colors.black)),
            Text(
              "Muhamadyogi413@gmail.com",
              style: GoogleFonts.poppins(
                  fontSize: 11, color: const Color(0xff26B893)),
            ),
            const SizedBox(height: 20),
          ],
        ),
        // masih manual :""
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
              onPressed: () {},
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

  Widget buttonPMPT() {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
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
                      "5",
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
                      "5",
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
                      "5",
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
                      "5",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget notifikasiProfile() {
    // if (viewModel.isEmpty){
    //return Center(
    //  child : Text("Belum ada post dari kamu,yuk mari mulai diskusi", style: GoogleFonts.poppins(fontSize: 25),)
    //)
    //} //untuk mevalidasi kategori mana yang akan dipilih... ListView dalam if
    return SizedBox(
      height: 200,
      child: ListView.separated(
          scrollDirection: Axis.vertical,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: 1,
          itemBuilder: (context, index) {
            return SizedBox(
                height: 200,
                child: ListTile(
                  leading: const Icon(
                    Icons.swipe_right_alt_rounded,
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nama",
                        style: GoogleFonts.poppins(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                        style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff26B893)),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Time",
                        style: GoogleFonts.poppins(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.blue,
                      )),
                ));
          }),
    );
  }
}
