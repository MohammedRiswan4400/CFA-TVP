import 'package:flutter/material.dart';

class SplashScreenProvider with ChangeNotifier {
  bool _isVisible = true;

  bool get isVisible => _isVisible;

  void visibility() {
    _isVisible = false;
    notifyListeners();
  }
}
