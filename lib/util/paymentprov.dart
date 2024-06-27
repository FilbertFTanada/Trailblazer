import 'package:flutter/material.dart';

class PaymentProvider with ChangeNotifier {
  List<String> _options = [
    'Credit/Debit Card', 
    'OVO', 
    'GoPay', 
    'Google Pay', 
    'PayPal',
  ];
  String _selected = 'Credit/Debit Card';

  List<String> get options => _options;
  String get Selected => _selected;

  void choice(String? val) {
    _selected = val!;
    notifyListeners();
  }

  String getImageUrl(String paymentMethod) {
    // Return the image URL based on the payment method
    switch (paymentMethod) {
      case 'Credit/Debit Card':
        return 'https://tse3.mm.bing.net/th?id=OIP.AzLrgwAB3l8zp80IjVr9XwHaFC&pid=Api&P=0&h=220';
      case 'OVO':
        return 'https://tse4.mm.bing.net/th?id=OIP.4U9Wm9Quj2pYTEO1-jzCSwHaEl&pid=Api&P=0&h=220';
      case 'GoPay':
        return 'https://toppng.com/uploads/preview/gopay-logo-png-image-116028322418uofv1gjg3.png';
      case 'Google Pay':
        return 'https://tse3.mm.bing.net/th?id=OIP.topY-ldmsiYwcpEA8jTKQwHaHa&pid=Api&P=0&h=220';
      case 'PayPal':
        return 'https://logodownload.org/wp-content/uploads/2014/10/paypal-logo-0.png';
      default:
        return 'https://via.placeholder.com/50';
    }
  }
}