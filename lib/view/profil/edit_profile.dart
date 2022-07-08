import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
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
              const SizedBox(
                height: 10,
              ),
              allMyTread()
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

  Widget allMyTread(){
    //if
    return SizedBox(
                height: MediaQuery.of(context).size.height*0.46,
                width: MediaQuery.of(context).size.width*2,
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) => const Divider(), 
                  itemCount: 3,
                  itemBuilder: (context, index){
                    return SizedBox(
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 30.0,
                          backgroundImage:
                              NetworkImage("https://www.kindpng.com/picc/m/24-248325_profile-picture-circle-png-transparent-png.png"),
                          backgroundColor: Colors.transparent,
                        ),
                        const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Nama", style: GoogleFonts.poppins(fontSize: 14),),
                                    Text("Albert Flores@gmail.com", style: GoogleFonts.poppins(fontSize: 13, color: const Color(0xff26B893)),),
                                  ],
                                ),
                                // const Spacer(),
                                //ganti jadi gesture detector
                                GestureDetector(
                                  onTap: (){},
                                  child: Container(
                                    height: 30,
                                    width: 75,
                                    decoration: BoxDecoration(
                                        color: const Color(0xff26B893),
                                        borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: const [Icon(Icons.add, color: Colors.white,), Text("Ikuti", style: TextStyle(color: Colors.white),)],
                                    ),
                                  )
                                )
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width*0.66,
                              child: Flexible(
                                child: Text("Pixel Buds Pro : Apakah Mampu Melawan AirPods Pro ? ", 
                                style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w500),
                                textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Text("Time", style: GoogleFonts.poppins(fontSize: 14),),
                            Row(
                              children: [
                                IconButton(
                                      icon: const Icon(Icons.thumb_up_alt_outlined, size: 18, color: Color(0xff26B893),),
                                      onPressed: (){},
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.thumb_down_alt_outlined, size: 18, color: Color(0xff26B893),),
                                      onPressed: (){},
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.chat, size: 18, color: Color(0xff26B893)),
                                      onPressed: (){},
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.remove_red_eye_outlined, size: 18, color: Color(0xff26B893),),
                                      onPressed: (){},
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.arrow_back_outlined, size: 18, color: Color(0xff26B893),),
                                      onPressed: (){},
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.share, size: 18, color: Color(0xff26B893),),
                                      onPressed: (){},
                                    ),
                              ],
                            )
                          ],
                        )
                      ],
                    )
                    );
                  }, 
                ),
                
              );
  }

}
