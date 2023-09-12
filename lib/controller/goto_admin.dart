import 'package:flutter/material.dart';
import 'package:trappra_chat/view/admin/players/add_students/add_gk.dart';
import 'package:trappra_chat/view/admin/players/add_students/add_students.dart';
import 'package:trappra_chat/view/admin/players/gk/gk.dart';
import 'package:trappra_chat/view/admin/players/kids/kids.dart';
import 'package:trappra_chat/view/admin/players/under20/screen_under20.dart';
import '../view/admin/players/under13/screen_under13.dart';
import '../view/admin/players/under15/screen_under15.dart';
import '../view/admin/banner/admin_banner.dart';
import '../view/admin/players/under18/screen_under18.dart';

void gotoAdminBanner(context) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => const AdminBanner(),
  ));
}

void gotoKids(context) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => const ScreenKids(),
  ));
}

void gotoUnder13(context) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => const ScreenUnder13(),
  ));
}

void gotoUnder15(context) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => const ScreenUnder15(),
  ));
}

void gotoUnder18(context) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => const ScreenUnder18(),
  ));
}

void gotoUnder20(context) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => const ScreenUnder20(),
  ));
}

void gotoGK(context) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => const ScreenGK(),
  ));
}

void gotoAddingStudents(context) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => const ScreenAddStudents(),
  ));
}

void gotoAddingGK(context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const ScreenAddGK(),
    ),
  );
}
