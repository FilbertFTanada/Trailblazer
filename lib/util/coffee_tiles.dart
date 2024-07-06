import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:Trailblazer_Flutter/pages/detail_item/detail_item.dart';
import 'package:Trailblazer_Flutter/util/provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class coffeeTile extends StatefulWidget {
  final coffeeType coffee_param;
  late int indexCoffee;

  coffeeTile({required this.coffee_param, required this.indexCoffee});

  @override
  _coffeeTileState createState() => _coffeeTileState();
}

class _coffeeTileState extends State<coffeeTile> {
  bool _isAdding = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 40),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
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
                builder: (context) => DetailItem(
                  coffee: widget.coffee_param,
                  index: widget.indexCoffee,
                ),
              ));
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
                    image: NetworkImage(widget.coffee_param.detail[widget.indexCoffee].image),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          // coffee name
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 5, top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.coffee_param.name,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.coffee_param.detail[widget.indexCoffee].nameDetail,
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
                        widget.coffee_param.detail[widget.indexCoffee].price,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: "Sora",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _addItemToCheckout(context);
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: _isAdding ? Color.fromARGB(255, 131, 75, 38) : Color.fromARGB(255, 198, 124, 74),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _addItemToCheckout(BuildContext context) {
    if (!_isAdding) {
      setState(() {
        _isAdding = true;
      });

      CoffeeNewProvider coffeeProvider = Provider.of<CoffeeNewProvider>(context, listen: false);
      coffeeProvider.addItemToSelected(widget.coffee_param, widget.indexCoffee);

      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Berhasil menambahkan item ke checkout"),
          duration: Duration(seconds: 2),
        ),
      );

      Timer(Duration(seconds: 2), () {
        setState(() {
          _isAdding = false;
        });
      });
    }
  }
}
