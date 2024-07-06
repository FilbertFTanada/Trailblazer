import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Trailblazer_Flutter/util/provider.dart';
import 'package:Trailblazer_Flutter/util/paymentprov.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  void _showCheckoutDialog(BuildContext context, double total) {
    List<SelectedCoffeeDetail> selectedItems =
        Provider.of<CoffeeNewProvider>(context, listen: false).selectedItems;
    PaymentProvider paymentProvider =
        Provider.of<PaymentProvider>(context, listen: false);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi Pembelian'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ...selectedItems.map((item) {
                  return ListTile(
                    title: Text('${item.coffeeTypeName} - ${item.detail.nameDetail}'),
                    subtitle: Text('${item.detail.qt} x \$${item.detail.price.replaceAll('\$', '')}'),
                    trailing: Text('\$${(double.parse(item.detail.price.replaceAll('\$', '')) * item.detail.qt).toStringAsFixed(2)}'),
                  );
                }).toList(),
                const Divider(),
                ListTile(
                  title: const Text('Total'),
                  trailing: Text('\$${total.toStringAsFixed(2)}'),
                ),
                const Divider(),
                ListTile(
                  title: const Text('Metode Pembayaran'),
                  trailing: Text(paymentProvider.Selected),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Beli'),
              onPressed: () {
                Provider.of<CoffeeNewProvider>(context, listen: false).resetSelectedItems();
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        'Pembelian Anda menggunakan pembayaran ${paymentProvider.Selected} berhasil!'),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<SelectedCoffeeDetail> selectedItems =
        Provider.of<CoffeeNewProvider>(context).selectedItems;

    double total = selectedItems.fold(
      0,
      (sum, item) =>
          sum +
          double.parse(item.detail.price.replaceAll('\$', '')) * item.detail.qt,
    );

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          foregroundColor: Colors.white,
          title: const Text(
            'Checkout',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black87,
        ),
        body: selectedItems.isNotEmpty
            ? Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: selectedItems.length,
                      itemBuilder: (context, index) {
                        SelectedCoffeeDetail coffee = selectedItems[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          padding: const EdgeInsets.only(top: 5),
                          height: 120,
                          color: Colors.grey.withOpacity(0.2),
                          child: Column(
                            children: [
                              ListTile(
                                isThreeLine: true,
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
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Sora"),
                                ),
                                subtitle: Text(
                                  coffee.detail.nameDetail,
                                  style: const TextStyle(fontFamily: "Sora"),
                                ),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '\$${(double.parse(coffee.detail.price.replaceAll('\$', '')) * coffee.detail.qt).toStringAsFixed(2)}',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontFamily: "Sora",
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 30,
                                margin: const EdgeInsets.all(0),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 120),
                                    IconButton(
                                      onPressed: () {
                                        CoffeeNewProvider coffeeProvider =
                                            Provider.of<CoffeeNewProvider>(
                                                context,
                                                listen: false);
                                        coffeeProvider.reduceItemQty(coffee);
                                      },
                                      icon: const Icon(Icons.remove),
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
                                      style: const TextStyle(fontSize: 15),
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
                                      icon: const Icon(Icons.add),
                                      iconSize: 16,
                                      color: const Color.fromARGB(255, 198, 127, 74),
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
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Total: \$${total.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontFamily: "Sora",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            _showCheckoutDialog(context, total);
                          },
                          style: TextButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 198, 127, 74),
                              shape: const RoundedRectangleBorder(),
                              minimumSize: const Size(150, 50)),
                          child: const Text(
                            "Checkout",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Sora",
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Center(
                    child: Text("Belum ada Pesanan"),
                  ),
                ],
              ));
  }
}
