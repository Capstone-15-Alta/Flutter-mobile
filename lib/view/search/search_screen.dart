import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forum_diskusi/viewmodel/search_viewModel.dart';
import 'package:forum_diskusi/viewmodel/user_viewModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];

  @override
  void initState() {
    Provider.of<UserViewModel>(context, listen: false).getAllDataUserInApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final saranUserProvider = Provider.of<UserViewModel>(context);
    final searchProvider = Provider.of<SearchUserViewModel>(context);
    final searchField = Form(
        key: _formKey,
        child: TextFormField(
          onFieldSubmitted: (value) async {},
          autofocus: false,
          validator: (value) {
            if (value!.isEmpty) {
              return ("Mohon diisi yang ingin di cari");
            }
            return null;
          },
          controller: searchController,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            fillColor: const Color.fromARGB(255, 236, 240, 243),
            prefixIcon: const Icon(Icons.search),
            filled: true,
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Cari di Forum Grup Diskusi",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ));

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: SingleChildScrollView(
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
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(child: searchField),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 50,
                      width: 80,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary:
                                const Color(0xff26B893), // Background color
                          ),
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) return;
                            searchProvider.getDataSearch(searchController.text);
                          },
                          child: Text(
                            "Search",
                            style: GoogleFonts.poppins(fontSize: 12),
                          )),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.66,
                  child: Builder(builder: (context) {
                    if (searchProvider.listDataSearch == null) {
                      return Column(
                        children: [
                          Text("Saran",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23,
                                  color: const Color(0xff26B893))),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: ListView.builder(
                                itemCount: saranUserProvider.listGetAllUserInApp.length
                                ,
                                itemBuilder: ((context, index) {
                                  return Column(
                                    children: [
                                      const SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          const CircleAvatar(
                                            radius: 23.0,
                                            backgroundImage: NetworkImage(
                                                "https://www.kindpng.com/picc/m/24-248325_profile-picture-circle-png-transparent-png.png"),
                                            backgroundColor: Colors.transparent,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                              // "nama",
                                              saranUserProvider
                                                .listGetAllUserInApp[index]['username']
                                          ),
                                          const Spacer(),
                                          Container(
                                            height: 35,
                                            width: 80,
                                            decoration: BoxDecoration(
                                              color: const Color(0xff26B893),
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  );
                                })),
                          )
                        ],
                      );
                    }
                    return ListView.builder(
                        itemCount: searchProvider.listDataSearch!.length,
                        itemBuilder: ((context, index) {
                          return Row(
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
                                              // "Nama"
                                              searchProvider
                                                  .listDataSearch![index]
                                                  .user!
                                                  .username!,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14),
                                            ),
                                            Text(
                                              // "Albert Flores@gmail.com",
                                              searchProvider
                                                  .listDataSearch![index]
                                                  .user!
                                                  .email!,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 13,
                                                  color:
                                                      const Color(0xff26B893)),
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
                                        // "Pixel Buds Pro : Apakah Mampu Melawan AirPods Pro ? ",
                                        searchProvider.listDataSearch![index]
                                            .description!,
                                        style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      // "Time",
                                      searchProvider
                                          .listDataSearch![index].createdAt!,
                                      style: GoogleFonts.poppins(fontSize: 14),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          );
                          // Row(
                          //   children: [
                          // Text(searchProvider
                          //     .listDataSearch![index].user!.username!
                          //         .toString()),
                          //     Text(searchProvider
                          //         .listDataSearch![index].description
                          //         .toString()),
                          //   ],
                          // );
                        }));
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
