import 'package:flutter/material.dart';
import 'package:Trailblazer_Flutter/util/paymentprov.dart';

class PaymentMethodPage extends StatelessWidget {
  final PaymentProvider paymentMethodProvider;

  const PaymentMethodPage({Key? key, required this.paymentMethodProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Methods'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two columns
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: paymentMethodProvider.options.length,
        itemBuilder: (context, index) {
          final paymentMethod = paymentMethodProvider.options[index];
          final selected = paymentMethod == paymentMethodProvider.Selected;
          return InkWell(
            onTap: () async {
              bool? confirm = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Confirm Payment Method'),
                  content: Text('Are you sure you want to use $paymentMethod as your payment method?'),
                  actions: [
                    TextButton(
                      child: const Text('Cancel'),
                      onPressed: () => Navigator.of(context).pop(false),
                    ),
                    TextButton(
                      child: const Text('Confirm'),
                      onPressed: () => Navigator.of(context).pop(true),
                    ),
                  ],
                ),
              );
              if (confirm ?? false) {
                paymentMethodProvider.choice(paymentMethod);
                Navigator.of(context).pop(true); // Go back to the settings page
              }
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: selected ? Colors.blue : Colors.grey,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    paymentMethodProvider.getImageUrl(paymentMethod), // Get image from provider
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 8),
                  Text(paymentMethod),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}