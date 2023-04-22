import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier{

  int _actualPage = 0;
  final PageController _pageController = PageController();

  int get actualPage =>_actualPage;
  set actualPage(int value){
    _actualPage = value;
    _pageController.animateToPage(value,curve: Curves.bounceOut, duration: const Duration(milliseconds: 250));
    notifyListeners();
  }

  PageController get pageController => _pageController;

}