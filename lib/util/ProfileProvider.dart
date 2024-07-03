import 'package:flutter/material.dart';

class PaymentProvider with ChangeNotifier {
  List<String> _options = ['Debit Card', 'OVO', 'GoPay', 'Google Pay', 'Qris'];
  String _selected = 'Debit Card';

  List<String> get options => _options;
  String get Selected => _selected;

  void choice(String? val) {
    _selected = val ?? '';
    notifyListeners();
  }
}

class NotificationProvider extends ChangeNotifier {
  int Selected = 0;

  void choice(val) {
    Selected = val;
    notifyListeners();
  }
}

class LanguageProvider with ChangeNotifier {
  List<String> _options = [
    'English',
    'Indonesia',
    'Spanish',
    'French',
    'German'
  ];
  String _selected = 'English';

  List<String> get options => _options;
  String get Selected => _selected;

  void choice(String? val) {
    _selected = val ?? '';
    notifyListeners();
  }
}
