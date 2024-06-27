import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Trailblazer_Flutter/util/provider.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mendapatkan daftar item yang dipilih dari provider
    List<Coffee> selectedItems =
        Provider.of<CoffeeProvider>(context).selectedItems;

    double total = selectedItems.fold(
      0,
      (sum, item) =>
          sum + double.parse(item.coffeePrice.replaceAll('\$', '')) * item.qty,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Column(
        children: [
          // Tampilkan detail item-item yang dipilih
          Expanded(
            child: ListView.builder(
              itemCount: selectedItems.length,
              itemBuilder: (context, index) {
                Coffee coffee = selectedItems[index];
                return ListTile(
                  title: Text(coffee.coffeeName),
                  subtitle: Text(coffee.coffeeDes),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Qty: ${coffee.qty}'), // Menampilkan qty
                      Text(coffee.coffeePrice),
                    ],
                  ),
                );
              },
            ),
          ),
          // Tampilkan total harga
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Total: \$${total.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
