import 'package:flutter/material.dart';
import 'package:forum_diskusi/model/thread_model.dart';
import 'package:forum_diskusi/view/comments/comments_screen.dart';
import 'package:forum_diskusi/viewmodel/comments_viewModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ButtonWidget extends StatefulWidget {
  final Data thread;
  final int? id;
  const ButtonWidget({Key? key, required this.thread, required this.id})
      : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  bool _hasBeenPressedLike = true;
  bool _hasBeenPressedIkuti = false;

  @override
  Widget build(BuildContext context) {
    final buttonProvider = Provider.of<CommentsViewModel>(context);
    return SizedBox(
        child: Row(
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
                        widget.thread.user?.username ?? "",
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                      Text(
                        widget.thread.user?.email ?? "",
                        style: GoogleFonts.poppins(
                            fontSize: 13, color: const Color(0xff26B893)),
                      ),
                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          _hasBeenPressedIkuti = !_hasBeenPressedIkuti;
                        });
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              _hasBeenPressedIkuti ? Icons.check : Icons.add,
                              color: Colors.white,
                            ),
                            _hasBeenPressedIkuti
                                ? const Text(
                                    "Mengikuti",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 9),
                                  )
                                : const Text(
                                    "Ikuti",
                                    style: TextStyle(color: Colors.white),
                                  )
                          ],
                        ),
                      ))
                ],
              ),
              Text(
                widget.thread.title ?? "",
                style: GoogleFonts.poppins(
                    fontSize: 13, color: const Color(0xff455154)),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.66,
                child: Text(
                  widget.thread.description ?? "",
                  style: GoogleFonts.poppins(
                      fontSize: 13, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                // "Time",

                widget.thread.createdAt ?? "",
                style: GoogleFonts.poppins(fontSize: 14),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      // widget.thread.likes![0].isLike!
                      _hasBeenPressedLike
                          ? Icons.favorite_border
                          : Icons.favorite,
                      size: 18,
                      color: _hasBeenPressedLike
                          ? const Color(0xff26B893)
                          : Colors.red,
                    ),
                    onPressed: () {
                      setState(() {
                        _hasBeenPressedLike = !_hasBeenPressedLike;
                      });
                      // widget.thread.likes;
                    },
                  ),
                  Text(
                    widget.thread.threadLikes.toString(),
                    style: const TextStyle(color: Color(0xff455154)),
                  ),
                  IconButton(
                    icon: const Icon(Icons.chat,
                        size: 18, color: Color(0xff26B893)),
                    onPressed: () {
                      buttonProvider.listgetComments.clear();
                      Navigator.of(context).push(PageRouteBuilder(pageBuilder:
                          (context, animation, secondaryAnimation) {
                        return CommentsScreen(
                          threadId: widget.thread.id!,
                          threadModel: widget.thread,
                        );
                      }, transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        final tween = Tween(begin: 0.0, end: 2.0);
                        return FadeTransition(
                          opacity: animation.drive(tween),
                          child: child,
                        );
                      }));
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.remove_red_eye_outlined,
                      size: 18,
                      color: Color(0xff26B893),
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_outlined,
                      size: 18,
                      color: Color(0xff26B893),
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.share,
                      size: 18,
                      color: Color(0xff26B893),
                    ),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        )
      ],
    ));
  }
}
