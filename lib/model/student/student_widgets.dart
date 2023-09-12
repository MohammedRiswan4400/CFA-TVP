import 'package:flutter/material.dart';
import '../colors/colors.dart';

class CampMatchSecondTitle extends StatelessWidget {
  const CampMatchSecondTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color.fromARGB(70, 42, 42, 42)),
      // width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}

class DataLinearGraph extends StatelessWidget {
  const DataLinearGraph({
    super.key,
    required this.title,
    required this.percentage,
    required this.value,
  });
  final String title;
  final String percentage;
  final double value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            Text(
              "$percentage %",
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        LinearProgressIndicator(
          minHeight: 5,
          value: value,
          color: const Color.fromARGB(255, 0, 0, 0),
          backgroundColor: const Color.fromARGB(141, 46, 46, 46),
        ),
        // Text("${(lValue * 100).toInt()} %"),
      ],
    );
  }
}

// ignore: must_be_immutable
class MatchOrCamp extends StatelessWidget {
  const MatchOrCamp({
    super.key,
    required this.startColor,
    required this.endColor,
    required this.title,
  });
  final Color startColor;
  final Color endColor;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              blurRadius: 10,
              spreadRadius: 1,
              color: Color.fromARGB(147, 0, 0, 0))
        ],
        gradient: LinearGradient(
          colors: [
            startColor,
            endColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: kWhite,
          ),
        ),
      ),
    );
  }
}

class StudentFormField extends StatelessWidget {
  const StudentFormField({
    super.key,
    required this.type,
    required this.action,
    required this.controller,
    required this.title,
  });
  // final String hint;
  final TextInputType type;
  final TextInputAction action;
  final TextEditingController controller;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 6,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => value != null && value.length < 2
                ? "Enter the Correct value"
                : null,
            // toolbarOptions: ,
            // validator: (value) =>
            //     value != null && value.length < 4 ? "Enter a valid Name" : null,
            controller: controller,
            keyboardType: type,
            textInputAction: action,
            decoration: InputDecoration(
              filled: true,
              fillColor: kField,
              hintText: title,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
