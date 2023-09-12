import 'package:flutter/material.dart';

class RulesRow extends StatelessWidget {
  const RulesRow({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(
    BuildContext context,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.arrow_circle_right_rounded,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.25,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
