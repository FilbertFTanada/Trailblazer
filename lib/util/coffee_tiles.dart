import 'package:Trailblazer_Flutter/pages/detail_item/detail_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:Trailblazer_Flutter/util/provider.dart';
import 'package:provider/provider.dart';

class coffeeTile extends StatelessWidget {
  final Coffee coffee;

  coffeeTile({required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => detailItem(coffee: coffee)));
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 130,
              child: Container(
                alignment: Alignment.topRight,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(coffee.coffeeIMGPath),
                    ),
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          //coffee name
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: 5, top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  coffee.coffeeName,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  coffee.coffeeDes,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 174, 174, 174),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //price
                    Text(
                      coffee.coffeePrice,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: "Sora",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //call to action button
                    GestureDetector(
                      onTap: () {
                        // Menambahkan item ke keranjang
                        CoffeeProvider coffeeProvider =
                            Provider.of<CoffeeProvider>(context, listen: false);
                        coffeeProvider.addItemToSelected(coffee);

                        // // Navigasi ke halaman checkout
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => CheckoutScreen(),
                        //   ),
                        // );
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 198, 124, 74),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
