import 'package:flutter/material.dart';

class ImageChangingProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  void indexChanging(index) {
    _currentIndex = index;
    notifyListeners();
  }
}
