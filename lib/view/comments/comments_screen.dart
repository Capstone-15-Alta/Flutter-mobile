import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {

  TextEditingController commentController =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
            color: const Color(0xffABABAB),
          ),
          title: SvgPicture.asset(
            "assets/image/logo.svg",
            height: 35,
            width: 35,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: Container(
          margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              Row(
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
                                  "Nama",
                                  // threadProvider.listGetThread[index]
                                  // .user!.username!,
                                  style: GoogleFonts.poppins(fontSize: 14),
                                ),
                                Text(
                                  "Albert Flores@gmail.com",
                                  //   threadProvider
                                  //       .listGetTrendingThread[index].email!,
                                  style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      color: const Color(0xff594545)),
                                ),
                              ],
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {});
                                },
                                child: AnimatedContainer(
                                  duration:
                                      const Duration(milliseconds: 300),
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
                                        style:
                                            TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.66,
                          child: Text(
                            "Pixel Buds Pro : Apakah Mampu Melawan AirPods Pro ? ",
                            // threadProvider
                            //     .listGetThread[index].description!,
                            style: GoogleFonts.poppins(
                                fontSize: 13, fontWeight: FontWeight.w500,),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Time",
                          // threadProvider.listGetThread[index].createdAt!,
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Reply",
                                  style: GoogleFonts.poppins(
                                      color: const Color(0xff26B893)),
                                )),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Share",
                                  style: GoogleFonts.poppins(
                                      color: const Color(0xff26B893)),
                                )),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Report",
                                  style: GoogleFonts.poppins(
                                      color: const Color(0xff26B893)),
                                ))
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const Divider(
                color: Color(0xffABABAB),
                thickness: 0.6,
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      child: SizedBox(
                          child: Column(
                        children: [
                          Row(
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Nama",
                                              // threadProvider.listGetThread[index]
                                              // .user!.username!,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      const Color(0xff594545)),
                                            ),
                                            Text(
                                              "Albert Flores@gmail.com",
                                              //   threadProvider
                                              //       .listGetTrendingThread[index].email!,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 13,
                                                  color:
                                                      const Color(0xff594545)),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              setState(() {});
                                            },
                                            child: AnimatedContainer(
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              height: 30,
                                              width: 75,
                                              decoration: BoxDecoration(
                                                color: const Color(0xff26B893),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: const [
                                                  Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                  ),
                                                  Text(
                                                    "Ikuti",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                            ))
                                      ],
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.66,
                                      child: Text(
                                        "Pixel Buds Pro : Apakah Mampu Melawan AirPods Pro ? ",
                                        // threadProvider
                                        //     .listGetThread[index].description!,
                                        style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xff9E9E9E)
                                        ),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Time",
                                      // threadProvider.listGetThread[index].createdAt!,
                                      style: GoogleFonts.poppins(fontSize: 14),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              "Reply",
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xff26B893)),
                                            )),
                                        TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              "Share",
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xff26B893)),
                                            )),
                                        TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              "Report",
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xff26B893)),
                                            ))
                
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      )),
                    );
                  },
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
// Row(
//                 children: [
//                   TextFormField(
//                     autofocus: false,
//                     controller: commentController,
//                     onSaved: (value) {
//                       commentController.text = value!;
//                     },
//                     textInputAction: TextInputAction.done,
//                     decoration: InputDecoration(
//                       fillColor: const Color.fromARGB(255, 236, 240, 243),
//                       filled: true,
//                       contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//                       hintText: "Masukan Comment",
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                     ),
//                   )
//                 ],
//               ),