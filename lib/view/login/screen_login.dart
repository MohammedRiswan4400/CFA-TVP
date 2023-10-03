import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../model/colors/colors.dart';
import '../../model/const/const.dart';
import '../../model/login/login_widgets.dart';

final emailController = TextEditingController();
final passwordController = TextEditingController();
bool _isPasswordVisible = false;

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Stack(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: Image.asset(
                    "assets/challegersSplash.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 1, 42, 82),
                        Color.fromARGB(199, 1, 42, 82),
                        Color.fromARGB(64, 1, 42, 82),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  height: MediaQuery.of(context).size.height / 1,
                  width: double.infinity,
                ),
                // SizedBox(),
                ListView(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Container(
                          //   color: kLightBlack,
                          //   height: 1,
                          // ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color.fromARGB(
                                          114, 102, 102, 102),
                                    ),
                                    height: 120,
                                    width: 120,
                                    child: Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(90),
                                        ),
                                        height: 100,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(90),
                                          child: Image.asset(
                                            "assets/challengersLogo.jpg",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                const Text(
                                  "Login",
                                  style: TextStyle(
                                    color: kWhite,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const MyHsizedBox(
                                  h: 25,
                                ),
                                LoginPageTextFieled(
                                  hintText: 'E-mail address',
                                  controller: emailController,
                                  obscure: false,
                                  // textInputAction: TextInputAction.next,
                                ),
                                const MyHsizedBox(
                                  h: 15,
                                ),
                                LoginPageTextFieled(
                                  hintText: 'Password',
                                  controller: passwordController,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      // Toggle the password visibility when the button is pressed
                                      setState(
                                        () {
                                          _isPasswordVisible =
                                              !_isPasswordVisible;
                                        },
                                      );
                                    },
                                  ),
                                  obscure: !_isPasswordVisible,
                                ),
                                const MyHsizedBox(
                                  h: 15,
                                ),
                                const MyHsizedBox(
                                  h: 15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    signIn(context);
                                    //  getSavedData(context);
                                  },
                                  child: const MyElevatedBotton(
                                    text: 'Login',
                                  ),
                                ),
                                const MyHsizedBox(
                                  h: 15,
                                ),
                                const Divider(
                                  color: Color.fromARGB(255, 142, 142, 142),
                                  thickness: 1,
                                  endIndent: 30,
                                  indent: 30,
                                ),
                                const MyHsizedBox(
                                  h: 15,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future signIn(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      // print(e);

      log(e.code);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          // width: double.negativeInfinity,
          content: Center(
            child: Text(
              e.code,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
          behavior: SnackBarBehavior.floating,
          // width: 10,
        ),
      );
    }
    // ignore: use_build_context_synchronously
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}
