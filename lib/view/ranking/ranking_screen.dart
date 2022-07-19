import 'package:flutter/material.dart';
import 'package:forum_diskusi/viewmodel/ranking_viewmodel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";

class RankingScreen extends StatefulWidget {
  const RankingScreen({Key? key}) : super(key: key);

  @override
  State<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // Provider.of<ThreadViewModel>(context, listen: false).getAllThread();
      Provider.of<RankingUserViewModel>(context, listen: false)
          .getDataRankingUser();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ranking = Provider.of<RankingUserViewModel>(context);
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
            child: Container(
          margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Ranking User",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: const Color(0xff26B893),
                    ),
                  ),
                  const Image(
                    image: AssetImage("assets/image/icon_medal.png"),
                    height: 25,
                    width: 25,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.81,
                child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemCount: ranking.listDataRankingUser.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const CircleAvatar(
                                radius: 15.0,
                                backgroundImage: NetworkImage(
                                    "https://www.kindpng.com/picc/m/24-248325_profile-picture-circle-png-transparent-png.png"),
                                backgroundColor: Colors.transparent,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.22,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                      // "Name",
                                      ranking.listDataRankingUser[index]
                                          ['username'],
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: const Color(0xff26B893))),
                                ),
                              ),
                              const Icon(
                                Icons.favorite_border,
                                color: Color(0xff26B893),
                              ),
                              Text(
                                  // "10"
                                  ranking.listDataRankingUser[index]
                                          ['total_like_thread']
                                      .toString(),
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: const Color(0xff26B893))),
                              const Icon(
                                FeatherIcons.feather,
                                color: Color(0xff26B893),
                              ),
                              Text(
                                  // "200",
                                  ranking.listDataRankingUser[index]
                                          ['total_threads']
                                      .toString(),
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: const Color(0xff26B893)))
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
