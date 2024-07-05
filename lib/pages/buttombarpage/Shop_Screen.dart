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
    List<SelectedCoffeeDetail> selectedItems =
        Provider.of<CoffeeNewProvider>(context, listen: false).selectedItems;

    double total = selectedItems.fold(
      0,
      (sum, item) =>
          sum +
          double.parse(item.detail.price.replaceAll('\$', '')) * item.detail.qt,
    );

    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          title: Text(
            'Checkout',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black87,
        ),
        body: Provider.of<CoffeeNewProvider>(context).selectedItems.length != 0
            ? Column(
                children: [
                  // Tampilkan detail item-item yang dipilih
                  Expanded(
                    child: ListView.builder(
                      itemCount: selectedItems.length,
                      itemBuilder: (context, index) {
                        SelectedCoffeeDetail coffee = selectedItems[index];
                        return Container(
                          margin: EdgeInsets.only(bottom: 5),
                          padding: EdgeInsets.only(top: 5),
                          height: 120,
                          color: Colors.grey.withOpacity(0.2),
                          child: Column(
                            children: [
                              ListTile(
                                isThreeLine: true,
                                // dense: true,
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    coffee.detail.image,
                                    width: 90,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(
                                  coffee.coffeeTypeName,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Sora"),
                                ),
                                subtitle: Text(
                                  coffee.detail.nameDetail,
                                  style: TextStyle(fontFamily: "Sora"),
                                ),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '\$${(double.parse(coffee.detail.price.replaceAll('\$', '')) * coffee.detail.qt).toStringAsFixed(2)}',
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
                                    SizedBox(width: 120),
                                    IconButton(
                                      onPressed: () {
                                        CoffeeNewProvider coffeeProvider =
                                            Provider.of<CoffeeNewProvider>(
                                                context,
                                                listen: false);
                                        coffeeProvider.reduceItemQty(coffee);
                                      },
                                      icon: Icon(Icons.remove),
                                      iconSize: 16,
                                      color: Colors.white,
                                      style: IconButton.styleFrom(
                                          backgroundColor: Colors.red,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                    ),
                                    Text(
                                      '  ${coffee.detail.qt}  ',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        CoffeeNewProvider coffeeProvider =
                                            Provider.of<CoffeeNewProvider>(
                                                context,
                                                listen: false);
                                        var coffeeTypeIndex =
                                            coffeeProvider.coffee.indexWhere(
                                          (c) =>
                                              c.name == coffee.coffeeTypeName,
                                        );

                                        if (coffeeTypeIndex != -1) {
                                          var coffeeType = coffeeProvider
                                              .coffee[coffeeTypeIndex];
                                          var detailIndex =
                                              coffeeType.detail.indexWhere(
                                            (d) =>
                                                d.nameDetail ==
                                                coffee.detail.nameDetail,
                                          );

                                          if (detailIndex != -1) {
                                            coffeeProvider.addItemToSelected(
                                                coffeeType, detailIndex);
                                          }
                                        }
                                      },
                                      icon: Icon(Icons.add),
                                      iconSize: 16,
                                      color: Color.fromARGB(255, 198, 127, 74),
                                      style: IconButton.styleFrom(
                                        backgroundColor: Colors.white,
                                      ),
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
                            top: BorderSide(
                                color: Colors.black.withOpacity(0.2)))),
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
                              backgroundColor:
                                  Color.fromARGB(255, 198, 127, 74),
                              shape: RoundedRectangleBorder(),
                              minimumSize: Size(150, 50)),
                        )
                      ],
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      child: Text("Belum ada Pesanan"),
                    ),
                  ),
                ],
              ));
  }
}
