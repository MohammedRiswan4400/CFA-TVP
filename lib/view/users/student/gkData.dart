// ignore_for_file: file_names

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:trappra_chat/model/colors/colors.dart';
import 'package:trappra_chat/view/admin/players/add_students/add_gk.dart';

import '../../../model/user/students/kg_widgets.dart';

class GkData extends StatelessWidget {
  const GkData({super.key, required this.under15});
  final ModelGK under15;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 10,
        backgroundColor: kBackground,
        shadowColor: kTransparent,
        toolbarHeight: 40,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
            child: Container(
              color: const Color.fromARGB(47, 231, 229, 229).withAlpha(900),
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: kBlack,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    height: 90,
                    width: 90,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: Image.network(
                        under15.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    under15.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "DOB - ${under15.dob}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(167, 0, 0, 0)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "ID : ${under15.uId}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(167, 0, 0, 0)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Phone - ${under15.phone}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(167, 0, 0, 0)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GkFullContaine(
                    under15: under15,
                  ),
                  MatchFullGkContainer(
                    under15: under15,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
