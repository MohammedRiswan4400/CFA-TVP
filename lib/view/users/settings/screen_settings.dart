import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'package:trappra_chat/controller/goto_user.dart';
import 'package:trappra_chat/view/login/screen_login.dart';
import '../../../model/colors/colors.dart';
import '../../../model/const/const.dart';
import '../../../model/user/settings/settings_widgets.dart';

class ScreenSettings extends StatelessWidget {
  const ScreenSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
          child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () => popNow(context),
                        child: const Icon(Icons.arrow_back_ios_new_rounded)),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          actions: [
                            Image.asset(
                              "assets/fusio.gif",
                            )
                          ],
                          content: const Text(
                            "This App is designed and developed \nby FUSIO WORX",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              // color: colorWhite,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: const ListTile(
                    leading: Icon(Icons.supervised_user_circle_outlined),
                    title: Text(
                      "About Us",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const Divider(
                  thickness: 2,
                ),
                GestureDetector(
                  onTap: () async {
                    Share.share(
                      'Download CFA TVP from Playstore For Free.\nDownload Now On Playstore\nhttps://play.google.com/store/apps/details?id=com.brototype.cfa_tvp',
                    );
                  },
                  child: const ListTile(
                    leading: Icon(Icons.shape_line_rounded),
                    title: Text(
                      "Invite Friends",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const Divider(
                  thickness: 2,
                ),
                GestureDetector(
                  onTap: () => gotoTermsAndConditions(context),
                  child: const ListTile(
                    leading: Icon(Icons.featured_play_list_outlined),
                    title: Text(
                      "Terms and Conditions",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const Divider(
                  thickness: 2,
                ),
                GestureDetector(
                  onTap: () {
                    gotoPrivacyScreen(context);
                  },
                  child: const ListTile(
                    leading: Icon(Icons.security),
                    title: Text(
                      "Privacy Policy",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const Divider(
                  thickness: 2,
                ),
                // GestureDetector(
                //   onTap: () {
                //     gotoLicenseScreen(context);
                //   },
                //   child: const ListTile(
                //     leading: Icon(Icons.badge_outlined),
                //     title: Text(
                //       "License",
                //       style:
                //           TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                //     ),
                //   ),
                // ),
                // const Divider(
                //   thickness: 2,
                // ),
                GestureDetector(
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              popNow(context);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                kField,
                              ),
                            ),
                            child: const Text(
                              "Cancel",
                              style: TextStyle(
                                  fontFamily: "Ubuntu",
                                  fontSize: 12,
                                  color: kBlack),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const ScreenLogin(),
                                ),
                              );
                              FirebaseAuth.instance.signOut();
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                kField,
                              ),
                            ),
                            child: const Text(
                              "Yes",
                              style: TextStyle(
                                color: kBlack,
                                fontFamily: "Ubuntu",
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                        content: const Text(
                          "Do you want to Logout",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            // color: colorWhite,
                          ),
                        ),
                      );
                    },
                  ),
                  child: const ListTile(
                    leading: Icon(
                      Icons.logout_rounded,
                      color: kred,
                    ),
                    title: Text(
                      "Logout",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Center(
                  child: Text(
                    "Connect with Us",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const ConnectUsRow(),
                const SizedBox(
                  height: 40,
                ),
                const Center(
                  child: Text(
                    "Version",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                const Center(
                  child: Text(
                    "1.0.0",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
