import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trappra_chat/model/const/const.dart';
import '../../../view/admin/home/admin_home.dart';
import '../../colors/colors.dart';

class StudentsAgeDiff extends StatelessWidget {
  const StudentsAgeDiff({
    super.key,
    required this.image,
    required this.age,
    required this.age2,
  });

  final String image;
  final String age;
  final String age2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: kBlurBlack,
                  blurRadius: 2,
                  spreadRadius: 2,
                )
              ],
              borderRadius: BorderRadius.circular(10),
              color: kField,
            ),
            height: double.infinity,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 5,
            ),
            child: SizedBox(
              // height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      "under",
                      style: TextStyle(
                        color: kAmber,
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(
                    // width: MediaQuery.of(context).size.width * 0.5,
                    height: 100,
                    child: FittedBox(
                      child: Row(
                        children: [
                          Text(
                            age,
                            style: const TextStyle(
                              color: kAmber,
                              fontSize: 50,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            age2,
                            overflow: TextOverflow.fade,
                            style: const TextStyle(
                              color: kWhite,
                              fontSize: 80,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StudentsAgeDiff2 extends StatelessWidget {
  const StudentsAgeDiff2({
    super.key,
    required this.image,
    required this.title,
    required this.title2,
  });

  final String image;
  final String title;
  final String title2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: kBlurBlack,
                  blurRadius: 2,
                  spreadRadius: 2,
                )
              ],
              borderRadius: BorderRadius.circular(10),
              color: kField,
            ),
            height: double.infinity,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 5,
            ),
            child: SizedBox(
              // height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: kAmber,
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          title2,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 70,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CostomeBottomSheet extends StatelessWidget {
  const CostomeBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // FirebaseAuth.instance.signOut();
        showModalBottomSheet(
          context: context,
          builder: (context) => Container(
            decoration: const BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(
                  50,
                ),
              ),
            ),
            height: MediaQuery.of(context).size.height / 3.5,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 94, 94, 94),
                          borderRadius: BorderRadius.circular(310),
                        ),
                        height: 7,
                        width: 30,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Logout",
                        style: TextStyle(
                            fontFamily: "Ubuntu",
                            fontSize: 14,
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        "Are you sure you want to Logout",
                        style: TextStyle(
                            fontFamily: "Ubuntu",
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                          const SizedBox(width: 50),
                          ElevatedButton(
                            onPressed: () {
                              popNow(context);
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
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90),
        ),
        height: 50,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset(
            "assets/challengersLogo.jpg",
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

class ExtraContainers extends StatelessWidget {
  const ExtraContainers({
    super.key,
    required this.icon,
    required this.text,
    // required this.functions,
  });
  final Icon icon;
  final String text;
  // final Function functions;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kField,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}

Future<BannerModel> fetchBanners() async {
  final bannerImages = await FirebaseFirestore.instance
      .collection("CFC")
      .doc("Challengers Banners")
      .get();
  return BannerModel.fromJson(bannerImages.data()!);
}
