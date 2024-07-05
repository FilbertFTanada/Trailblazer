import 'package:Trailblazer_Flutter/pages/detail_item/detail_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:Trailblazer_Flutter/util/provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class coffeeTile extends StatelessWidget {
  final coffeeType coffee_param;
  late int indexCoffee;

  coffeeTile({required this.coffee_param, required this.indexCoffee});

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
                  builder: (context) => detailItem(
                        coffee: coffee_param,
                        index: indexCoffee,
                      )));
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
                      image:
                          NetworkImage(coffee_param.detail[indexCoffee].image),
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
                  coffee_param.name,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  coffee_param.detail[indexCoffee].nameDetail,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 174, 174, 174),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      coffee_param.detail[indexCoffee].price,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: "Sora",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        CoffeeNewProvider coffeeProvider =
                            Provider.of<CoffeeNewProvider>(context,
                                listen: false);
                        coffeeProvider.addItemToSelected(
                            coffee_param, indexCoffee);
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
