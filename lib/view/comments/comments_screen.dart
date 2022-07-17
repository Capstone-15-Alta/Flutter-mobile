import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:forum_diskusi/viewmodel/comments_viewModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../model/thread_model.dart';

class CommentsScreen extends StatefulWidget {
  final int threadId;
  final Data threadModel;
  const CommentsScreen(
      {Key? key, required this.threadId, required this.threadModel})
      : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  TextEditingController commentController = TextEditingController();
  bool isInit = true;

  @override
  void didChangeDependencies() {
    isInit = false;
    if (isInit == true) {
      Provider.of<CommentsViewModel>(context, listen: false)
          .getAllComments(widget.threadId);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final commentProvider = Provider.of<CommentsViewModel>(context);
    if (commentProvider.listgetComments.isEmpty) {
      commentProvider.getAllComments(widget.threadId);
    }

    final commentField = TextFormField(
      autofocus: false,
      controller: commentController,
      onSaved: (value) {
        commentController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        fillColor: const Color(0xffF5F5F5),
        filled: true,
        enabledBorder: const OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderSide: BorderSide(color: Colors.transparent, width: 0.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

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
                                  // "Nama",
                                  widget.threadModel.user!.username!,
                                  // threadProvider.listGetThread[index]
                                  // .user!.username!,
                                  style: GoogleFonts.poppins(fontSize: 14),
                                ),
                                Text(
                                  widget.threadModel.user!.email!,
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
                                  duration: const Duration(milliseconds: 300),
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
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.66,
                          child: Text(
                            widget.threadModel.description!,
                            // threadProvider
                            //     .listGetThread[index].description!,
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          // "Time",
                          widget.threadModel.createdAt!,
                          // threadProvider.listGetThread[index].createdAt!,
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton(
                                onPressed: () {
                                  // CommentAPI().getComment(widget.threadId);
                                },
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
                child: Stack(
                  children: [
                    ListView.separated(
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                      itemCount: commentProvider.listgetComments.length,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                  commentProvider
                                                      .listgetComments[index]
                                                      .user!['username'],
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: const Color(
                                                          0xff594545)),
                                                ),
                                                Text(
                                                  commentProvider
                                                      .listgetComments[index]
                                                      .user!['email'],
                                                  //   threadProvider
                                                  //       .listGetTrendingThread[index].email!,
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 13,
                                                      color: const Color(
                                                          0xff594545)),
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
                                                    color:
                                                        const Color(0xff26B893),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
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
                                                            color:
                                                                Colors.white),
                                                      )
                                                    ],
                                                  ),
                                                ))
                                          ],
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.66,
                                          child: Text(
                                            commentProvider
                                                .listgetComments[index]
                                                .comment!,
                                            // threadProvider
                                            //     .listGetThread[index].description!,
                                            style: GoogleFonts.poppins(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xff9E9E9E)),
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          commentProvider.listgetComments[index]
                                              .created_at!,
                                          // threadProvider.listGetThread[index].createdAt!,
                                          style:
                                              GoogleFonts.poppins(fontSize: 14),
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
                                                      color: const Color(
                                                          0xff26B893)),
                                                )),
                                            TextButton(
                                                onPressed: () {},
                                                child: Text(
                                                  "Share",
                                                  style: GoogleFonts.poppins(
                                                      color: const Color(
                                                          0xff26B893)),
                                                )),
                                            TextButton(
                                                onPressed: () {},
                                                child: Text(
                                                  "Report",
                                                  style: GoogleFonts.poppins(
                                                      color: const Color(
                                                          0xff26B893)),
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
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: commentField,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              height: 50,
                              width: 80,

                              //                           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              //   RoundedRectangleBorder(
                              //     borderRadius: BorderRadius.circular(10),
                              //   ),
                              // ),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    primary: const Color(
                                        0xff26B893), // Background color
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "Search",
                                    style: GoogleFonts.poppins(fontSize: 12),
                                  )),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
