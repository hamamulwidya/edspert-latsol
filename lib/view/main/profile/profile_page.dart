import 'package:flutter/material.dart';
import 'package:git_project/constants/r.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Akun Saya"),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Edit",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 28,
              bottom: 60,
              right: 15,
              left: 15,
            ),
            decoration: BoxDecoration(
              color: R.colors.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(9),
                bottomRight: Radius.circular(9),
              ),
            ),
            child: Row(children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nama User",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Nama Sekolah User",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                R.assets.imgUser,
                width: 50,
                height: 50,
              ),
            ]),
          ),
          // SizedBox(height: 15),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(blurRadius: 7, color: Colors.black.withOpacity(0.25))
              ],
            ),
            margin: EdgeInsets.symmetric(vertical: 18, horizontal: 13),
            padding: EdgeInsets.symmetric(vertical: 18, horizontal: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Identitas Diri"),
                SizedBox(height: 15),
                Text(
                  "Name Lengkap",
                  style: TextStyle(
                    color: R.colors.greySubtitleHome,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "Name Lengkap User",
                  style: TextStyle(
                    // color: R.colors.greySubtitleHome,
                    fontSize: 13,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Name Lengkap",
                  style: TextStyle(
                    color: R.colors.greySubtitleHome,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "Name Lengkap User",
                  style: TextStyle(
                    // color: R.colors.greySubtitleHome,
                    fontSize: 13,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Name Lengkap",
                  style: TextStyle(
                    color: R.colors.greySubtitleHome,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "Name Lengkap User",
                  style: TextStyle(
                    // color: R.colors.greySubtitleHome,
                    fontSize: 13,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Name Lengkap",
                  style: TextStyle(
                    color: R.colors.greySubtitleHome,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "Name Lengkap User",
                  style: TextStyle(
                    // color: R.colors.greySubtitleHome,
                    fontSize: 13,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Name Lengkap",
                  style: TextStyle(
                    color: R.colors.greySubtitleHome,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "Name Lengkap User",
                  style: TextStyle(
                    // color: R.colors.greySubtitleHome,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 13),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(blurRadius: 7, color: Colors.black.withOpacity(0.25))
              ],
            ),
            child: Row(children: [
              Icon(
                Icons.exit_to_app,
                color: Colors.red,
              ),
              SizedBox(width: 10),
              Text(
                "Title",
                style: TextStyle(
                  color: Colors.red,
                  // fontSize: 12,
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
