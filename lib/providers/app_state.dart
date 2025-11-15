import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  String _role = '';
  String _languague = 'Tiếng Việt';
  bool _isRevenueVisible = true;
  bool _isExpenseVisible = true;
  String _accountStatus = 'unVerify';
  String _selectedBank = '';

  String get role => _role;
  String get languague => _languague;
  bool get isRevenueVisible => _isRevenueVisible;
  bool get isExpenseVisible => _isExpenseVisible;
  String get accountStatus => _accountStatus;
  String get selectedBank => _selectedBank;

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

  void setAccountStatus(String value) {
    _accountStatus = value;
    notifyListeners();
  }

  void setSelectedBank(String value) {
    _selectedBank = value;
    notifyListeners();
  }
}
