import 'package:flutter/cupertino.dart';

class CategoryProvider extends ChangeNotifier {
  String _category = '자유';
  String get category => _category;

  void categorySelected(String categoryValue) {
    _category = categoryValue;
    notifyListeners();
  }

  void setDefaultCategory() {
    _category = '자유';
  }
}