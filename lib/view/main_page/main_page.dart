import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trappra_chat/view/admin/home/admin_home.dart';
import 'package:trappra_chat/view/login/screen_login.dart';

import '../users/home/screen_home.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          // log("Error");
          return const Center(
            child: Text("Somthing Went Wrong"),
          );
        } else if (snapshot.hasData) {
          // ignore: unrelated_type_equality_checks

          if (snapshot.data!.email == 'salmanadmin@gmail.com') {
            return const AdminHome();
          } else {
            return const ScreenHome();
          }
          // return const ScreenHome();
        } else {
          return const ScreenLogin();
        }
      },
    );
  }
}
