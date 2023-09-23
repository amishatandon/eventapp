import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  //ChangeNotifier provides change notification to its listner.
  int selectedCategoryId = 0;
  void updateCategoryId(int selectedCategoryId) {
    this.selectedCategoryId = selectedCategoryId;
    notifyListeners();
  }
}
