import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:Trailblazer_Flutter/util/provider.dart';


class PurchaseMessage {
  final String id;
  final String title;
  final String body;
  final DateTime date;
  final List<SelectedCoffeeDetail> items; 
  final double total; 
  final String paymentMethod; 

  PurchaseMessage({
    required this.id,
    required this.title,
    required this.body,
    required this.date,
    required this.items,
    required this.total,
    required this.paymentMethod,
  });
}

class PurchaseMessageProvider with ChangeNotifier {
  List<PurchaseMessage> _messages = [];

  List<PurchaseMessage> get messages => _messages;

  void addMessage(PurchaseMessage message) {
    _messages.add(message);
    notifyListeners();
  }
}