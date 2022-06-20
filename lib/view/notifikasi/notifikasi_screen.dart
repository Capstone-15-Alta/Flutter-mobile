import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NotifScreen extends StatefulWidget {
  const NotifScreen({ Key? key }) : super(key: key);

  @override
  State<NotifScreen> createState() => _NotifScreenState();
}

class _NotifScreenState extends State<NotifScreen> {

  bool _hasBeenPressedButton1 = false;
  bool _hasBeenPressedButton2 = false;
  bool _hasBeenPressedButton3 = false;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
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
                      Text("Notifikasi", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 23, color: const Color(0xff26B893))),
                      Text("Hai, ayo cek notifikasi yang masuk", style: GoogleFonts.poppins(fontSize: 13,fontWeight: FontWeight.w500, color: const Color(0xff26B893)),),
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
              const SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 100,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: _hasBeenPressedButton1 ?  Colors.black : const Color(0xff26B893),
                      ),
                      onPressed: (){
                        setState(() {
                          if (_hasBeenPressedButton1 == false || _hasBeenPressedButton2 == true || _hasBeenPressedButton3 == true){
                            _hasBeenPressedButton1 = true ;
                            _hasBeenPressedButton2 = false;
                            _hasBeenPressedButton3 = false;
                          }
                        });
                      }, 
                      child: const Text("")
                    ),
                  ),
                  // if (vaksinA == false || vaksinB == true || vaksinC == true || vaksinD == true) { tempString = 'a'; vaksinA = true; vaksinB = false; vaksinC = false; vaksinD = false; }
                  const SizedBox(width: 15,),
                  SizedBox(
                    height: 50,
                    width: 100,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: _hasBeenPressedButton2 ? Colors.black : const Color(0xff26B893),
                      ),
                      onPressed: (){
                        setState(() {
                          if (_hasBeenPressedButton1 == true || _hasBeenPressedButton2 == false || _hasBeenPressedButton3 == true){
                            _hasBeenPressedButton2 = true;
                            _hasBeenPressedButton1 = false;
                            _hasBeenPressedButton3 = false;
                          }
                        });
                      }, 
                      child: const Text("")
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 50,
                    width: 100,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: _hasBeenPressedButton3 ? Colors.black : const Color(0xff26B893),
                      ),
                      onPressed: (){
                        setState(() {
                          if (_hasBeenPressedButton1 == true || _hasBeenPressedButton2 == true || _hasBeenPressedButton3 == false){
                            _hasBeenPressedButton3 = true;
                            _hasBeenPressedButton2 = false;
                            _hasBeenPressedButton1 = false;
                          }
                        });
                      }, 
                      child: const Text("")
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Expanded(
                child: SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 1,
                    itemBuilder: ((context, index) {
                      return const ListTile(
                        leading: CircleAvatar(
                          radius: 23.0,
                          backgroundImage:
                              NetworkImage("https://www.kindpng.com/picc/m/24-248325_profile-picture-circle-png-transparent-png.png"),
                          backgroundColor: Colors.transparent,
                        ),
                        title: Text("asdadad"),
                        subtitle: Text("sadasdasdas"),
                        trailing: Icon(Icons.delete),
                      );
                    })
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}