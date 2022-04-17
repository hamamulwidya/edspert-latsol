import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:git_project/constants/r.dart';
import 'package:git_project/view/login_page.dart';
import 'package:git_project/view/main/latihan_soal/home_page.dart';
import 'package:git_project/view/main_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String route = "spash_screen";

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // TODO redirect to register or home

        Navigator.of(context).pushReplacementNamed(MainPage.route);
      } else {
        Navigator.of(context).pushReplacementNamed(LoginPage.route);
      }
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
