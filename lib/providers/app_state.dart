import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  String _role = '';
  String _languague = 'Tiếng Việt';
  bool _isRevenueVisible = true;
  bool _isExpenseVisible = true;

  String get role => _role;
  String get languague => _languague;
  bool get isRevenueVisible => _isRevenueVisible;
  bool get isExpenseVisible => _isExpenseVisible;

  void setRole(String value) {
    _role = value;
    notifyListeners();
  }

  void setLanguage(String value) {
    _languague = value;
    notifyListeners();
  }

  void setRevenueVisible(bool value) {
    _isRevenueVisible = value;
    notifyListeners();
  }

  void setExpenseVisible(bool value) {
    _isExpenseVisible = value;
    notifyListeners();
  }
}
