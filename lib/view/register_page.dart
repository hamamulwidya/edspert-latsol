import 'package:flutter/material.dart';
import 'package:git_project/constants/r.dart';
import 'package:git_project/repository/auth_api.dart';
import 'package:git_project/view/login_page.dart';
import 'package:git_project/view/main_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  static String route = "register_page";
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

enum Gender { lakiLaki, perempuan }

class _RegisterPageState extends State<RegisterPage> {
  String gender = "Laki-laki";
  List<String> classSlta = ["10", "11", "12"];
  String selectedClass = "10";

  final emailController = TextEditingController();

  onTapGender(Gender genderInput) {
    if (genderInput == Gender.lakiLaki) {
      gender = "Laki-laki";
    } else {
      gender = "Perempuan";
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f3f5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 20),
        child: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0))),
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Yuk isi data diri!",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: ButtonLogin(
            onTap: () async {
              final body = {
                "user_name": "Edufren",
                "user_email": "hamamul@widyaedu.com",
                "user_whatsapp": "082255550496",
                "user_foto":
                    "https://api.widyaedu.com/assets/uploads/avatar/5a57317764486c77636d396d6157786c_emptyprofile.png",
                "user_propinsi": "Prov. Aceh",
                "user_kabupaten": "Kab. Aceh Barat",
                "sosmed": "@widyaedu",
                "user_prop_sekolah": "Prov. D.I. Yogyakarta",
                "user_kab_sekolah": "Kab. Sleman",
                "user_asal_sekolah": "SMA NEGERI 1 MEULABOH",
                "kelas": "12",
                "uniqcode": "7552",
                "referral": "EDUEE2",
                "date_create": "2022-02-24 08:28:55",
                "jenjang": "SMA",
                "user_gender": "Laki-laki",
                "user_propinsi_id": "060000",
                "user_prop_sekolah_id": "040000",
                "user_kab_sekolah_id": "040200",
                "user_token":
                    "cmZvRr5RRLuLGJX64T-Grb:APA91bF3DkBHPR3NtBqm_f12d9wNd-YvyjJmEkU7f4smY2d8ODJCvGBitC6LExh-GJ27qinvx0NGGkkppyiJIoxG_FDKOSdggLU-g5-W7eJeqzv5JrYUSg4U4xvXU0E_VuiP20gVEUSV",
                "verified_phone": "true",
                "user_status": "verified",
                "apple_id": "empty"
              };
              print(emailController.text);
             final result = await AuthApi().postRegisterUser(body);
             
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(MainPage.route, (context) => false);
            },
            backgroundColor: R.colors.primary,
            borderColor: R.colors.primary,
            child: Text(
              R.strings.daftar,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RegisterTextField(
                controller: emailController,
                hintText: 'Email Anda',
                title: "Email",
              ),
              RegisterTextField(
                hintText: 'Nama Lengkap Anda',
                title: "Nama Lengkap",
              ),
              SizedBox(height: 5),
              Text(
                "Jenis Kelamin",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: gender == "Laki-laki"
                              ? R.colors.primary
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                                width: 1, color: R.colors.greyBorder),
                          ),
                        ),
                        onPressed: () {
                          onTapGender(Gender.lakiLaki);
                        },
                        child: Text(
                          "Laki-laki",
                          style: TextStyle(
                            fontSize: 14,
                            color: gender == "Laki-laki"
                                ? Colors.white
                                : Color(0xff282828),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: gender == "Perempuan"
                              ? R.colors.primary
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                                width: 1, color: R.colors.greyBorder),
                          ),
                        ),
                        onPressed: () {
                          onTapGender(Gender.perempuan);
                        },
                        child: Text(
                          "Perempuan",
                          style: TextStyle(
                            fontSize: 14,
                            color: gender == "Perempuan"
                                ? Colors.white
                                : Color(0xff282828),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text(
                "Kelas",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  border: Border.all(color: R.colors.greyBorder),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                      value: selectedClass,
                      items: classSlta
                          .map(
                            (e) => DropdownMenuItem<String>(
                              child: Text(e),
                              value: e,
                            ),
                          )
                          .toList(),
                      onChanged: (String? val) {
                        selectedClass = val!;
                        setState(() {});
                      }),
                ),
              ),
              SizedBox(height: 5),
              RegisterTextField(
                hintText: 'Nama Sekolah',
                title: "Nama Sekolah",
              ),
              // Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterTextField extends StatelessWidget {
  const RegisterTextField({
    Key? key,
    required this.title,
    required this.hintText,
    this.controller,
  }) : super(key: key);
  final String title;
  final String hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 5),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            border: Border.all(color: R.colors.greyBorder),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: R.colors.greyHintText,
                )),
          ),
        ),
      ],
    );
  }
}
