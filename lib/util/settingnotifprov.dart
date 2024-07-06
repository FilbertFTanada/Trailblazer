import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier{
  int Selected = 0;

  void choice(val){
    Selected = val;
    notifyListeners();
  }
}
