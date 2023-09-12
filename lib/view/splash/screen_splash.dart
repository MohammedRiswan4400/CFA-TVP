import 'package:flutter/material.dart';
import 'package:trappra_chat/model/colors/colors.dart';
import '../../controller/goto_user.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    gotoScreen(context);
    // gotoScreen
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 4, 29, 51), kBlack],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        // color: Colors.amber,
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: CircleAvatar(
            backgroundColor: kTransparent,
            radius: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Image.asset(
                "assets/challengersLogo.jpg",
                fit: BoxFit.cover,
                // scale: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
