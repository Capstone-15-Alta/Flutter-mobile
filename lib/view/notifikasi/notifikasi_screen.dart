import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forum_diskusi/view/notifikasi/nofication_perScreen.dart';
import 'package:google_fonts/google_fonts.dart';

class NotifScreen extends StatefulWidget {
  const NotifScreen({Key? key}) : super(key: key);

  @override
  State<NotifScreen> createState() => _NotifScreenState();
}

class _NotifScreenState extends State<NotifScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _tabController = TabController(length: 3, vsync: this);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: SvgPicture.asset(
                  "assets/image/logo.svg",
                  height: 35,
                  width: 35,
                )),
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
                          height: 20,
                        ),
                        Text("Notifikasi",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                                color: const Color(0xff26B893))),
                        Text(
                          "Hai, ayo cek notifikasi yang masuk",
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
                const NotifikasiButton(),
                // punten mas, kenalin aku septri. kita sekelompok cepstone... mau nanya mas, di front end web pada udah selesaikah yang bagian ini?
              ],
            ),
          ),
        ),
      ),
    );
  }
}
