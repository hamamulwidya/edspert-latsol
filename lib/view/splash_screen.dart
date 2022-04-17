import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:git_project/constants/r.dart';
import 'package:git_project/models/data_by_user_email.dart';
import 'package:git_project/repository/auth_api.dart';
import 'package:git_project/view/login_page.dart';
import 'package:git_project/view/main/latihan_soal/home_page.dart';
import 'package:git_project/view/main_page.dart';
import 'package:git_project/view/register_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String route = "spash_screen";

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () async {
      final user = FirebaseAuth.instance.currentUser;
      print("test");
      if (user != null) {
        final response = await AuthApi().getUserbyEmail("user.email");
        print(response);
        if (response != null) {
          final userData = DataUserByEmail.fromJson(response);
          if (userData.status == 1) {
            Navigator.of(context).pushReplacementNamed(MainPage.route);
          } else {
            Navigator.of(context).pushReplacementNamed(RegisterPage.route);
          }
        } else {
          Navigator.of(context).pushReplacementNamed(LoginPage.route);
        }
      } else {
        Navigator.of(context).pushReplacementNamed(LoginPage.route);
      }
      debugPrint("end of line");

    });

    return Scaffold(
      backgroundColor: R.colors.primary,
      body: Center(
        child: Image.asset(
          R.assets.icSplash,
          width: MediaQuery.of(context).size.width * 0.5,
        ),
      ),
    );
  }
}
