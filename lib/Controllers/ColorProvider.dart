import 'package:flutter/material.dart';

class ColorProvider with ChangeNotifier{
  int colorId = 2;

  colorChanger(id){
    colorId = id;
    notifyListeners();
  }
}