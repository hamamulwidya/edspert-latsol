import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:git_project/view/login_page.dart';
import 'package:git_project/view/main_page.dart';
import 'package:git_project/view/register_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProviderCotroller extends ChangeNotifier {
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  directAfterSplashScren(context) {
    Timer(const Duration(seconds: 3), () {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        Navigator.of(context).pushReplacementNamed(LoginPage.route);
      } else {
        Navigator.of(context).pushReplacementNamed(MainPage.route);
      }
      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  signin(context) async {
    await signInWithGoogle();

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("User tidak ditemukan")));
    } else {
      Navigator.of(context).pushNamed(RegisterPage.route);
    }
  }

  sigout(context) async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushNamedAndRemoveUntil(LoginPage.route, (route) => false);
  }
}
