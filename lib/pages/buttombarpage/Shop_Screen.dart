import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Trailblazer_Flutter/util/provider.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    List<Coffee> selectedItems =
        Provider.of<CoffeeProvider>(context).selectedItems;

    double total = selectedItems.fold(
      0,
      (sum, item) =>
          sum + double.parse(item.coffeePrice.replaceAll('\$', '')) * item.qty,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black87,
      ),
      body: Column(
        children: [
          // Tampilkan detail item-item yang dipilih
          Expanded(
            child: ListView.builder(
              itemCount: selectedItems.length,
              itemBuilder: (context, index) {
                Coffee coffee = selectedItems[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 5),
                  padding: EdgeInsets.only(top: 5),
                  height: 120,
                  color: Colors.grey.withOpacity(0.2),
                  child: Column(
                    children: [
                      ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            coffee.coffeeIMGPath,
                            width: 80,
                            fit: BoxFit.fill,
                          ),
                        ),
                        title: Text(
                          coffee.coffeeName,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Sora"),
                        ),
                        subtitle: Text(
                          coffee.coffeeDes,
                          style: TextStyle(fontFamily: "Sora"),
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '\$${(double.parse(coffee.coffeePrice.replaceAll('\$', '')) * coffee.qty).toStringAsFixed(2)}',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Sora",
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 30,
                        margin: EdgeInsets.all(0),
                        child: Row(
                          children: [
                            SizedBox(width: 110),
                            IconButton(
                              onPressed: () {
                                CoffeeProvider coffeeProvider =
                                    Provider.of<CoffeeProvider>(context,
                                        listen: false);
                                coffeeProvider.reduceItemQty(coffee);
                              },
                              icon: Icon(Icons.remove),
                              iconSize: 16,
                              color: Colors.white,
                              style: IconButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                            Text(
                              '  ${coffee.qty}  ',
                              style: TextStyle(fontSize: 15),
                            ),
                            IconButton(
                              onPressed: () {
                                CoffeeProvider coffeeProvider =
                                    Provider.of<CoffeeProvider>(context,
                                        listen: false);
                                coffeeProvider.addItemToSelected(coffee);
                              },
                              icon: Icon(Icons.add),
                              iconSize: 16,
                              color: Colors.white,
                              style: IconButton.styleFrom(
                                  backgroundColor: Colors.blue),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          // Tampilkan total harga
          Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.black.withOpacity(0.2)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Total: \$${total.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Sora",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Checkout",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Sora",
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 198, 127, 74),
                      shape: RoundedRectangleBorder(),
                      minimumSize: Size(150, 50)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
