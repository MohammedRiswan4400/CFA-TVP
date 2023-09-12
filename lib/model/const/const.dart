import 'package:flutter/cupertino.dart';

class MyHsizedBox extends StatelessWidget {
  const MyHsizedBox({
    super.key,
    required this.h,
  });
  final double h;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h,
    );
  }
}

void popNow(context) {
  Navigator.of(context).pop();
}
