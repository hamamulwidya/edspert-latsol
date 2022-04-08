import 'dart:async';

import 'package:flutter/material.dart';
import 'package:git_project/constants/r.dart';
import 'package:git_project/view/login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String route = "spash_screen";

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context) => LoginPage()));
      Navigator.of(context).pushNamed(LoginPage.route);
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
