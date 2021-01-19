import 'package:flutter/material.dart';

class PageProvider with ChangeNotifier{
  int pageNumber = 0;

  PageController pageController = PageController();

  void changePage(newPageNumber){
    pageNumber = newPageNumber;
    notifyListeners();
  }
}