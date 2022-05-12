import 'package:flutter/material.dart';

class MainModel with ChangeNotifier {
  int _temp = 100;

  int get getTemp => _temp;

  void getInfo(String location) {
    
    notifyListeners();
  }
}
