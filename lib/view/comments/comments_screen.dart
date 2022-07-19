import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:forum_diskusi/model/postComment_Model.dart';
import 'package:forum_diskusi/viewmodel/comments_viewmodel.dart';
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
  bool descTextShow = false;

  @override
  void didChangeDependencies() {
    isInit = false;
    if (isInit == true) {
      Provider.of<CommentsViewModel>(context, listen: false)
          .getAllComments(widget.threadId);
    }
    super.didChangeDependencies();
  }

  void clearText() {
    commentController.clear();
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
          borderSide: BorderSide(color: Colors.black, width: 0.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final submitButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        primary: const Color(0xff4E9BB9),
      ),
      onPressed: () async {
        try {
          await Fluttertoast.showToast(msg: "Berhasil Comment")
              .then((value) => commentProvider.postCommentOnThread(
                    PostCommentModel(
                      comment: commentController.text,
                      thread_id: widget.threadId,
                    ),
                  ))
              .then((value) => clearText());
        } catch (e) {
          Fluttertoast.showToast(msg: "Gagal Comment");
        }
      },
      child: const Icon(Icons.arrow_forward),
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
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.threadModel.user!.username!,
                                  style: GoogleFonts.poppins(fontSize: 14),
                                ),
                                Text(
                                  widget.threadModel.user!.email!,
                                  style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      color: const Color(0xff594545)),
                                ),
                              ],
                            ),
                            GestureDetector(
                                onTap: () {},
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
                        Text(
                          widget.threadModel.title ?? "",
                          style: GoogleFonts.poppins(
                              fontSize: 13, color: const Color(0xff455154)),
                        ),
                        SizedBox(
                          child: Text(
                            widget.threadModel.description!,
                            maxLines: descTextShow ? 100 : 2,
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              descTextShow = !descTextShow;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              descTextShow
                                  ? const Text(
                                      "Tampilkan Sedikit",
                                      style: TextStyle(color: Colors.blue),
                                    )
                                  : const Text("Tampilkan Lebih",
                                      style: TextStyle(color: Colors.blue))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.threadModel.createdAt!,
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
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 13,
                                                        color: const Color(
                                                            0xff594545)),
                                                  ),
                                                ],
                                              ),
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
                                              style: GoogleFonts.poppins(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xff9E9E9E)),
                                              textAlign: TextAlign.justify,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            commentProvider
                                                .listgetComments[index]
                                                .created_at!,
                                            style: GoogleFonts.poppins(
                                                fontSize: 14),
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
                            ),
                          ),
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
                                height: 50, width: 60, child: submitButton),
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
