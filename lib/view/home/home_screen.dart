import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forum_diskusi/view/home/home_thread.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool _hasBeenPressedButtonTerbaru = false;
  bool _hasBeenPressedButtonTrending = false;
  bool _hasBeenPressedButtonKategori = false;

@override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff26B893),
          onPressed: (){
            Navigator.of(context).pushReplacement(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return const HomeThread();
                  }, transitionsBuilder: (context, animation, secondaryAnimation, child){
                    final tween = Tween(begin: 0.0, end: 2.0);
                    return FadeTransition(
                      opacity: animation.drive(tween),
                      child: child,
                    );
                  }
                )
            );
          },
          child: const Icon(Icons.add, color: Colors.white,),
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
                )
              ],
              ),
              const SizedBox(height: 5,),
              SizedBox(
                height: 35,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 120,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: _hasBeenPressedButtonTerbaru ?  const Color(0xff26B893) : Colors.white,
                          onPrimary: _hasBeenPressedButtonTerbaru ?  Colors.white :const Color(0xff26B893),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              side: BorderSide(color: Color(0xff26B893))
                            )
                        ),
                        onPressed: (){
                          setState(() {
                            if (_hasBeenPressedButtonTerbaru == false || _hasBeenPressedButtonTrending == true || _hasBeenPressedButtonKategori == true){
                            _hasBeenPressedButtonTerbaru = true ;
                            _hasBeenPressedButtonTrending = false;
                            _hasBeenPressedButtonKategori = false;
                          }
                          });
                        }, 
                        icon: const Icon(Icons.access_time_sharp), 
                        label: Text("Terbaru", style: GoogleFonts.poppins(fontSize: 15),)
                      ),
                    ),

                    const SizedBox(width: 10,),
                    SizedBox(
                      width: 130,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: _hasBeenPressedButtonTerbaru ?  Colors.white : const Color(0xff26B893),
                          onPrimary: _hasBeenPressedButtonTrending ? Colors.white : const Color(0xff26B893),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              side: BorderSide(color: Color(0xff26B893))
                            )
                        ),
                        onPressed: (){
                          setState(() {
                            if (_hasBeenPressedButtonTerbaru == true || _hasBeenPressedButtonTrending == false || _hasBeenPressedButtonKategori == true){
                            _hasBeenPressedButtonTerbaru = false ;
                            _hasBeenPressedButtonTrending = true;
                            _hasBeenPressedButtonKategori = false;
                          }
                          });
                        }, 
                        icon: const Icon(Icons.north_east_outlined), 
                        label: Text("Trending", style: GoogleFonts.poppins(fontSize: 15),)
                      ),
                    ),
                    const SizedBox(width: 10,),
                    SizedBox(
                      width: 130,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: _hasBeenPressedButtonTerbaru ? Colors.white : const Color(0xff26B893),
                          onPrimary: _hasBeenPressedButtonKategori ?Colors.white : const Color(0xff26B893),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              side: BorderSide(color: Color(0xff26B893))
                            )
                        ),
                        onPressed: (){
                          setState(() {
                            if (_hasBeenPressedButtonTerbaru == true || _hasBeenPressedButtonTrending == true || _hasBeenPressedButtonKategori == false){
                            _hasBeenPressedButtonTerbaru = false ;
                            _hasBeenPressedButtonTrending = false;
                            _hasBeenPressedButtonKategori = true;
                          }
                          });
                        }, 
                        icon: const Icon(Icons.category), 
                        label: Text("Kategori", style: GoogleFonts.poppins(fontSize: 15),)
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.46,
                width: MediaQuery.of(context).size.width*2,
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) => const Divider(), 
                  itemCount: 1,
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
                
              )
              
            ],
          ),
        ),
      ),
    );
  }
}