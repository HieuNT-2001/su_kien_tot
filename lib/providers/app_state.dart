import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  String _role = '';

  String get role => _role;

  void setRole(String value) {
    _role = value;
    notifyListeners();
  }
}
