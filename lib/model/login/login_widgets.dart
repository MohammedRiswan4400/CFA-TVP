import 'package:flutter/material.dart';

import '../colors/colors.dart';

class MyElevatedBotton extends StatelessWidget {
  const MyElevatedBotton({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 60,
      width: double.infinity,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: kWhite,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class LoginPageTextFieled extends StatelessWidget {
  LoginPageTextFieled({
    super.key,
    required this.hintText,
    required this.controller,
    this.suffixIcon,
    required this.obscure,
    // required this.textInputAction,.
  });
  final String hintText;
  final TextEditingController controller;
  // final TextInputAction textInputAction;
  final bool obscure;
  Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // textInputAction: textInputAction,
      obscureText: obscure,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: kHint,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: kField,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
