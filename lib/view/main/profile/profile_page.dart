import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:git_project/controller/AuthProviderController.dart';
import 'package:git_project/view/login_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late AuthProviderCotroller controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = Provider.of<AuthProviderCotroller>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            controller.sigout(context);
          }, child: Text("Signout")),
          Text("PROFILE")
        ],
      ),
    );
  }
}
