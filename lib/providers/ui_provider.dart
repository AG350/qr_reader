import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int _selectedMenuOpt = 1;
  int get selectedMenuOpt => this._selectedMenuOpt;
  set selectedMenuOpt(int value) {
    this._selectedMenuOpt = value;
    notifyListeners();
  }
}
