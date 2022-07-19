import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forum_diskusi/model/list_dropdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final double backgroungImageHeight = 150;
  final double profileImageHeight = 80;
  final double shadeProfileImage = 100;
  final double positionedLeftImage = 10;

  TextEditingController namaAwalController = TextEditingController();
  TextEditingController namaAkhirController = TextEditingController();

  TextEditingController nomorHandphoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController tanggalLahirController = TextEditingController();
  TextEditingController tingkatPendidikanlController = TextEditingController();

  TextEditingController negaraController = TextEditingController();
  TextEditingController kotaController = TextEditingController();

  String _dueDate = 'dd-MM-yyyy';
  final currentDate = DateTime.now();
  String pendidikan = '';
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    final top = backgroungImageHeight - shadeProfileImage / 2;
    final topForName = backgroungImageHeight - positionedLeftImage;
    final leftForName = shadeProfileImage + positionedLeftImage * 2;

    final fieldNamaAwal = TextFormField(
      autofocus: false,
      controller: namaAwalController,
      onSaved: (value) {
        namaAwalController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        fillColor: const Color.fromARGB(255, 236, 240, 243),
        filled: true,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Masukan Nama Awal",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    final fieldNamaAkhir = TextFormField(
      autofocus: false,
      controller: namaAkhirController,
      onSaved: (value) {
        namaAkhirController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        fillColor: const Color.fromARGB(255, 236, 240, 243),
        filled: true,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Masukan Nomor Handphone",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    final fieldNomorHandphone = TextFormField(
      autofocus: false,
      controller: namaAkhirController,
      onSaved: (value) {
        namaAkhirController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        fillColor: const Color.fromARGB(255, 236, 240, 243),
        filled: true,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Masukan Nama Akhir",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    final fieldEmail = TextFormField(
      autofocus: false,
      controller: emailController,
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        fillColor: const Color.fromARGB(255, 236, 240, 243),
        filled: true,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Masukan Email",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    final pendidikanField = DropdownButtonHideUnderline(
      child: DropdownButton(
          isDense: true,
          isExpanded: true,
          hint: const Text("Masukan  Tingkat Pendidikan"),
          value: selectedValue,
          onChanged: (String? value) {
            setState(
              () {
                selectedValue = value ?? "";
                pendidikan = selectedValue!;
              },
            );
          },
          items: dropdownItems),
    );

    final fieldKota = TextFormField(
      autofocus: false,
      controller: kotaController,
      onSaved: (value) {
        kotaController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        fillColor: const Color.fromARGB(255, 236, 240, 243),
        filled: true,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Masukan Kota",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    final fieldNegara = TextFormField(
      autofocus: false,
      controller: negaraController,
      onSaved: (value) {
        negaraController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        fillColor: const Color.fromARGB(255, 236, 240, 243),
        filled: true,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Masukan Negara",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    final kembaliButton = Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      child: MaterialButton(
        minWidth: 50,
        onPressed: () async {
          Navigator.pop(context);
        },
        child: Text(
          "Kembali",
          style: GoogleFonts.poppins(
            color: const Color(0xff26B893),
            fontSize: 14,
          ),
        ),
      ),
    );

    final submitButton = Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(10),
      color: const Color(0xff26B893),
      child: MaterialButton(
        minWidth: 50,
        onPressed: () {},
        child: Text(
          "Sumbit",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.all(16),
                  child: Center(
                      child: SvgPicture.asset(
                    "assets/image/logo.svg",
                    height: 35,
                    width: 35,
                  ))),
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.centerLeft,
                children: [
                  backGroundImage(),
                  Positioned(
                    child: profileImage(),
                    top: top,
                  ),
                  Positioned(
                      top: topForName, left: leftForName, child: profileName()),
                ],
              ),
              SizedBox(
                height: profileImageHeight - 30,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Edit Profile",
                      style: GoogleFonts.poppins(
                          fontSize: 23,
                          color: const Color(0xffCACED8),
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            title: Text(
                              "Nama Awal",
                              style: GoogleFonts.poppins(fontSize: 15),
                            ),
                            subtitle: fieldNamaAwal,
                          ),
                        ),
                        Expanded(
                            child: ListTile(
                          title: Text(
                            "Nama Akhir",
                            style: GoogleFonts.poppins(fontSize: 15),
                          ),
                          subtitle: fieldNamaAkhir,
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Nama Handphone",
                      style: GoogleFonts.poppins(fontSize: 15),
                    ),
                    fieldNomorHandphone,
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Email",
                      style: GoogleFonts.poppins(fontSize: 15),
                    ),
                    fieldEmail,
                    const SizedBox(
                      height: 10,
                    ),
                    // buildDatePicker()
                    Text(
                      "Tanggal Lahir",
                      style: GoogleFonts.poppins(fontSize: 15),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 236, 240, 243),
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: buildDatePicker(context),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // buildDatePicker()
                    Text(
                      "Tingkat Pendidikan",
                      style: GoogleFonts.poppins(fontSize: 15),
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        border: Border.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 0.80),
                      ),
                      child: Container(
                          margin: const EdgeInsets.all(10),
                          child: pendidikanField),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Kota",
                      style: GoogleFonts.poppins(fontSize: 15),
                    ),
                    fieldKota,
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Negara",
                      style: GoogleFonts.poppins(fontSize: 15),
                    ),
                    fieldNegara,
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        kembaliButton,
                        const SizedBox(
                          width: 15,
                        ),
                        submitButton,
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () async {
                final selectDate = await showDatePicker(
                    context: context,
                    initialDate: currentDate,
                    firstDate: DateTime(1990),
                    lastDate: DateTime(currentDate.year + 5));
                setState(() {
                  if (selectDate != null) {
                    _dueDate = DateFormat('dd-MM-yyyy').format(selectDate);
                  }
                });
              },
              child: Text(
                _dueDate,
                style: const TextStyle(color: Colors.grey),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget backGroundImage() {
    return Stack(
      children: [
        SizedBox(
            width: double.infinity,
            height: backgroungImageHeight,
            child: Image(
              image: const NetworkImage(
                "https://wallpaperaccess.com/full/17353.jpg",
              ),
              width: double.infinity,
              height: backgroungImageHeight,
              fit: BoxFit.cover,
            )),
        Container(
          alignment: Alignment.topLeft,
          width: 130,
          child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      side: BorderSide(color: Color(0xff26B893)))),
              onPressed: () {},
              icon: const Icon(
                Icons.camera_alt_sharp,
                color: Color(0xff26B893),
              ),
              label: Text(
                "Ganti Cover",
                style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff26B893)),
              )),
        ),
      ],
    );
  }

  Widget profileImage() {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Container(
              height: shadeProfileImage,
              width: shadeProfileImage,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.black),
            ),
          ),
          Center(
            child: Container(
              height: profileImageHeight,
              width: profileImageHeight,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Widget profileName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text("Muhammad Yogi",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: Colors.black)),
            Text(
              "Muhamadyogi413@gmail.com",
              style: GoogleFonts.poppins(
                  fontSize: 11, color: const Color(0xff26B893)),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ],
    );
  }
}
