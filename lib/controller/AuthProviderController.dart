import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:git_project/view/login_page.dart';
import 'package:git_project/view/main_page.dart';
import 'package:git_project/view/register_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProviderCotroller extends ChangeNotifier {
  Future<UserCredential?> signInWithGoogleWeb() async {
    // Create a new provider
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider
        .addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithPopup(googleProvider);

    // Or use signInWithRedirect
    // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
  }

  Future<UserCredential?> signInWithGoogle() async {
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
    if (kIsWeb) {
      await signInWithGoogleWeb();
    } else {
      await signInWithGoogle();
    }

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("User tidak ditemukan")));
    } else {
      Navigator.of(context).pushNamed(RegisterPage.route);
    }
  }

  sigout(context) async {
    if (!kIsWeb) {
      await GoogleSignIn().signOut();
    } else {
      GoogleSignIn _googleSignIn = GoogleSignIn(
        // Optional clientId
        clientId: '604293972193-1so9i4hv1cha7k8j1voomr32acf2vr1a.apps.googleusercontent.com',
        scopes: <String>[
          'email',
          'https://www.googleapis.com/auth/contacts.readonly',
        ],
      );
      await _googleSignIn.signOut();
    }
    print(FirebaseAuth.instance.currentUser?.displayName);
    await FirebaseAuth.instance.signOut();
    print(FirebaseAuth.instance.currentUser?.displayName);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(LoginPage.route, (route) => false);
  }
}
