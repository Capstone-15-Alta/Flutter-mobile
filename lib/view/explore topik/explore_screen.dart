

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: SvgPicture.asset("assets/image/logo.svg", height: 35, width:35 ,)),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20,),
                        Text("Hello, Yogi", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 23, color: const Color(0xff26B893))),
                        Text("Apa yang ingin kamu baca hari ini?", style: GoogleFonts.poppins(fontSize: 13,fontWeight: FontWeight.w500, color: const Color(0xff26B893)),),
                        const SizedBox(height:20),
                      ],
                    ),
                    const CircleAvatar(
                    radius: 23.0,
                    backgroundImage:
                        NetworkImage("https://www.kindpng.com/picc/m/24-248325_profile-picture-circle-png-transparent-png.png"),
                    backgroundColor: Colors.transparent,
                  ),
                  ],
                ),
                Text("Olahraga", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 15, color: const Color(0xff26B893))),
        
                Container(
                  height: MediaQuery.of(context).size.height*0.36,
                  width: MediaQuery.of(context).size.width*0.90,
                  decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)
                          ),
                            margin: const EdgeInsets.all(10),
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    separatorBuilder: (BuildContext context, int index) => const Divider(), 
                    itemCount: 1,
                    itemBuilder: (context, index){
                      return SizedBox(
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 25.0,
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
                                child: Text("Pixel Buds Pro : Apakah Mampu Melawan AirPods Pro ? ", 
                                style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w500),
                                textAlign: TextAlign.justify,
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
                  
                ),
                const SizedBox(height: 10,),
                Text("Otomotif", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 15, color: const Color(0xff26B893))),
        
                Container(
                  height: MediaQuery.of(context).size.height*0.36,
                  width: MediaQuery.of(context).size.width*0.90,
                  decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)
                          ),
                            margin: const EdgeInsets.all(10),
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    separatorBuilder: (BuildContext context, int index) => const Divider(), 
                    itemCount: 1,
                    itemBuilder: (context, index){
                      return SizedBox(
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 25.0,
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
                                child: Text("Pixel Buds Pro : Apakah Mampu Melawan AirPods Pro ? ", 
                                style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w500),
                                textAlign: TextAlign.justify,
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
                  
                )
              ],
              
            ),
          ),
        )
      ),
    );
  }
}