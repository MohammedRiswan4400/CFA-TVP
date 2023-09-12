import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:trappra_chat/model/colors/colors.dart';
import 'package:trappra_chat/model/const/const.dart';
import '../../../controller/goto_admin.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Challengers Admin"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => gotoAdminBanner(context),
              child: const EditContainers(
                firstColor: kEditBannerFirst,
                secondColor: kEditBannerSecond,
                title: "Edit Banner",
              ),
            ),
            GestureDetector(
              onTap: () => gotoAddingStudents(context),
              child: const EditContainers(
                firstColor: kEditBannerFirst,
                secondColor: kEditBannerSecond,
                title: "Add Students",
              ),
            ),
            GestureDetector(
              onTap: () => gotoKids(context),
              child: const EditContainers(
                firstColor: kEditBannerFirst,
                secondColor: kEditBannerSecond,
                title: "Kids",
              ),
            ),
            GestureDetector(
              onTap: () => gotoUnder13(context),
              child: const EditContainers(
                firstColor: kEditBannerFirst,
                secondColor: kEditBannerSecond,
                title: "Under 13",
              ),
            ),
            GestureDetector(
              onTap: () => gotoUnder15(context),
              child: const EditContainers(
                firstColor: kEditBannerFirst,
                secondColor: kEditBannerSecond,
                title: "Under 15",
              ),
            ),
            GestureDetector(
              onTap: () => gotoUnder18(context),
              child: const EditContainers(
                firstColor: kEditBannerFirst,
                secondColor: kEditBannerSecond,
                title: "Under 18",
              ),
            ),
            GestureDetector(
              onTap: () => gotoUnder20(context),
              child: const EditContainers(
                firstColor: kEditBannerFirst,
                secondColor: kEditBannerSecond,
                title: "Under 20",
              ),
            ),
            GestureDetector(
              onTap: () => gotoGK(context),
              child: const EditContainers(
                firstColor: kEditBannerFirst,
                secondColor: kEditBannerSecond,
                title: "GK",
              ),
            ),
            const LogOut(),
          ],
        ),
      ),
    );
  }
}

class LogOut extends StatelessWidget {
  const LogOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        const lottie =
            'https://lottie.host/695f8677-0af6-4afa-9b02-3c036b5d4014/qqnXVe1fP1.json';
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Logout"),
              content: Lottie.network(
                lottie,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    popNow(context);
                  },
                  child: const Text(
                    "Go to Home",
                    style: TextStyle(
                      // fontFamily: myFont,
                      fontWeight: FontWeight.bold,
                      // color: unselectedItemsColor,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    popNow(context);
                    FirebaseAuth.instance.signOut();
                  },
                  child: const Text(
                    "Logout",
                    style: TextStyle(
                      // fontFamily: myFont,
                      fontWeight: FontWeight.bold,
                      // color: unselectedItemsColor,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: const EditContainers(
        firstColor: kEditBannerFirst,
        secondColor: kEditBannerSecond,
        title: "Log Out",
      ),
    );
  }
}

class EditContainers extends StatelessWidget {
  const EditContainers({
    super.key,
    required this.title,
    required this.firstColor,
    required this.secondColor,
  });
  final String title;
  final Color firstColor;
  final Color secondColor;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              gradient: LinearGradient(colors: [
                firstColor,
                secondColor,
              ])),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

class BannerModel {
  final List<dynamic> bannerImages;

  BannerModel({
    required this.bannerImages,
  });

  Map<String, dynamic> toJson() => {
        "bannerImages": bannerImages,
      };

  static BannerModel fromJson(Map<String, dynamic> json) => BannerModel(
        bannerImages: json["bannerImages"],
      );
}
