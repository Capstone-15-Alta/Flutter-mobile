import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

@override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: (){

          },
          child: const Icon(Icons.add, color: Color(0xff26B893),),
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
              Center(child: SvgPicture.asset("assets/image/logo.svg", height: 35, width:35 ,)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20,),
                      Text("Hello, Yogi", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 23, color: const Color(0xff26B893))),
                      Text("Apa yang ingin kamu baca hari ini?", style: GoogleFonts.poppins(fontSize: 13),),
                      const SizedBox(height:20),
                    ],
                  ),
                  const CircleAvatar(
                  radius: 23.0,
                  backgroundImage:
                      NetworkImage("https://www.kindpng.com/picc/m/24-248325_profile-picture-circle-png-transparent-png.png"),
                  backgroundColor: Colors.transparent,
                )              ],
              ),
              const SizedBox(height: 5,),
              SizedBox(
                height: 35,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(),
                        shape: BoxShape.rectangle,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.access_time_sharp, color: Color(0xff26B893),
                          ),
                          Text(
                          "Terbaru",
                        ),
                        ],
                      )
                    ),
                    const SizedBox(width: 10,),
                    Container(
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(),
                        shape: BoxShape.rectangle,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.arrow_back, color: Color(0xff26B893),
                          ),
                          Text(
                          "Terbaru",
                        ),
                        ],
                      )
                    ),
                    const SizedBox(width: 10,),
                    Container(
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(),
                        shape: BoxShape.rectangle,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.category, color: Color(0xff26B893),
                          ),
                          Text(
                          "Terbaru",
                        ),
                        ],
                      )
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                height: 200,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index){
                    return Row(
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
                                    Text("Email", style: GoogleFonts.poppins(fontSize: 11),),

                                  ],
                                ),

                              ],
                            ),
                            Text("Message\nmessage", style: GoogleFonts.poppins(fontSize: 11),),
                            const SizedBox(height: 5,),
                            Text("Time", style: GoogleFonts.poppins(fontSize: 14),),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.thumb_up_alt_outlined, size: 18,),
                                      onPressed: (){},
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.thumb_down_alt_outlined, size: 18,),
                                      onPressed: (){},
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.chat, size: 18,),
                                      onPressed: (){},
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.remove_red_eye_outlined, size: 18,),
                                      onPressed: (){},
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.arrow_back_outlined, size: 18,),
                                      onPressed: (){},
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.share, size: 18,),
                                      onPressed: (){},
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    );
                  }
                ),
              )
              
            ],
          ),
        ),
      ),
    );
  }
}