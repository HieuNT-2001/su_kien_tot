import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  String _role = '';
  String _languague = 'Tiếng Việt';

  String get role => _role;
  String get languague => _languague;

  void setRole(String value) {
    _role = value;
    notifyListeners();
  }

  void setLanguage(String value) {
    _languague = value;
    notifyListeners();
  }
}
