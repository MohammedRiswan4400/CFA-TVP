import 'package:flutter/material.dart';
import 'package:trappra_chat/view/admin/players/add_students/add_gk.dart';
import 'package:trappra_chat/view/admin/players/add_students/add_students.dart';
import 'package:trappra_chat/view/users/rules/screen_rules.dart';
import 'package:trappra_chat/view/users/settings/privacy/screen_privacy.dart';
import 'package:trappra_chat/view/users/settings/terms_and_conditions/screen_terms.dart';
import 'package:trappra_chat/view/users/students_list/kids/kids_students_list.dart';
import 'package:trappra_chat/view/users/students_list/under20/under20_students_list.dart';
import '../view/main_page/main_page.dart';
import '../view/users/settings/screen_settings.dart';
import '../view/users/student/gkData.dart';
import '../view/users/student/studentData.dart';
import '../view/users/students_list/gk/gk_students_list.dart';
import '../view/users/students_list/under13/under13_students_list.dart';
import '../view/users/students_list/under15/under15_students_list.dart';
import '../view/users/students_list/under18/under18_students_list.dart';

Future gotoScreen(context) async {
  await Future.delayed(const Duration(seconds: 5));
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => const MainPage(),
    ),
  );
}

void gotoKidsScreen(context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const ScreenKidsList(),
    ),
  );
}

void gotoRulesScreen(context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const ScreenRules(),
    ),
  );
}

void gotoSettingsScreen(context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const ScreenSettings(),
    ),
  );
}

void gotoLicenseScreen(context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return Theme(
          data: ThemeData(),
          child: const LicensePage(
            applicationName: 'CFA TVP',
            applicationVersion: '1.0.0',
          ),
        );
      },
    ),
  );
}

void gotoPrivacyScreen(context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const PrivacyPolicy(),
    ),
  );
}

void gotoTermsAndConditions(context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const TermsAndConditions(),
    ),
  );
}

void gotoUnder13Screen(context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const ScreenUnder13List(),
    ),
  );
}

void gotoUnder15Screen(context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const ScreenUnder15StudentsList(),
    ),
  );
}

void gotoUnder18Screen(context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const ScreenUnder18List(),
    ),
  );
}

void gotoUnder20Screen(context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const ScreenUnder20List(),
    ),
  );
}

void gotoGkScreen(context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const ScreenGkList(),
    ),
  );
}

void gotoUnder15StudentDetils(
    {required BuildContext context, required ModelStudents student}) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => StudentData(
        under15: student,
      ),
    ),
  );
}

void gotoGkStudentDetils(
    {required BuildContext context, required ModelGK student}) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => GkData(
        under15: student,
      ),
    ),
  );
}
