import 'package:flutter/material.dart';

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
    _selected = val!;
    notifyListeners();
  }
}
