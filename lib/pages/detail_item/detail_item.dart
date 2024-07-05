import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:Trailblazer_Flutter/util/provider.dart';
import 'package:readmore/readmore.dart';

class DetailItem extends StatefulWidget {
  final coffeeType coffee;
  final int index;

  DetailItem({Key? key, required this.coffee, required this.index})
      : super(key: key);

  @override
  _DetailItemState createState() => _DetailItemState();
}

class _DetailItemState extends State<DetailItem> {
  String selectedSize = 'M'; // Default size selection

  @override
  Widget build(BuildContext context) {
    bool isSoldOut = selectedSize == 'S' || selectedSize == 'L';

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Detail",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    widget.coffee.detail[widget.index].image,
                    fit: BoxFit.cover,
                    color: isSoldOut ? Colors.grey.withOpacity(0.8) : null,
                    colorBlendMode: isSoldOut ? BlendMode.saturation : null,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  widget.coffee.name,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      fontFamily: "Sora"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  widget.coffee.detail[widget.index].nameDetail,
                  style: TextStyle(
                      fontSize: 13, color: Colors.blueGrey, fontFamily: 'Sora'),
                ),
              ),
              SizedBox(height: 20),
              Text("Description",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Sora")),
              SizedBox(height: 10),
              ReadMoreText(
                widget.coffee.detail[widget.index].desc,
                trimLines: 3,
                textAlign: TextAlign.justify,
                trimMode: TrimMode.Line,
                trimCollapsedText: "Read More",
                trimExpandedText: "Show Less",
                moreStyle: TextStyle(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Sora"),
                lessStyle: TextStyle(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Sora"),
                style: TextStyle(
                    color: Color.fromARGB(255, 154, 154, 154),
                    fontFamily: "Sora"),
              ),
              SizedBox(height: 20),
              Text("Size",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ['S', 'M', 'L'].map((size) {
                  bool isSelected = selectedSize == size;
                  bool isSoldOutChip = size == 'S' || size == 'L';
                  return ChoiceChip(
                    label: Text(size),
                    labelPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 3),
                    checkmarkColor: Colors.white,
                    selected: isSelected,
                    onSelected: (isSelected) {
                      setState(() {
                        selectedSize = size;
                      });
                    },
                    backgroundColor: isSelected
                        ? Color.fromARGB(255, 198, 127, 74)
                        : isSoldOutChip
                            ? Colors.grey.withOpacity(0.4)
                            : Colors.white,
                    selectedColor: Color.fromARGB(255, 198, 127, 74),
                    labelStyle: TextStyle(
                        color: isSelected || isSoldOutChip
                            ? Colors.white
                            : Colors.black),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                          color: Color.fromARGB(255, 214, 214, 214), width: 1),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: BorderDirectional(
              top: BorderSide(color: Color.fromARGB(255, 217, 217, 217))),
          borderRadius: BorderRadiusDirectional.circular(30),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Price',
                    style: TextStyle(
                        color: Color.fromARGB(255, 154, 154, 154),
                        fontFamily: "Sora"),
                  ),
                  SizedBox(height: 5),
                  isSoldOut
                      ? Text(
                          'Sold Out',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.red,
                              fontFamily: "Sora"),
                        )
                      : Text(
                          "\$${_calculatePrice(selectedSize, widget.coffee).toStringAsFixed(2)}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            fontFamily: "Sora",
                            color: Color.fromARGB(255, 198, 124, 78),
                          ),
                        ),
                ],
              ),
              TextButton(
                onPressed: isSoldOut
                    ? null
                    : () {
                        CoffeeNewProvider coffeeProvider =
                            Provider.of<CoffeeNewProvider>(context,
                                listen: false);
                        coffeeProvider.addItemToSelected(
                            widget.coffee, widget.index);
                      },
                child: Text(
                  "Buy Now",
                  style: TextStyle(color: Colors.white, fontFamily: "Sora"),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: isSoldOut
                      ? Colors.grey.withOpacity(0.7)
                      : const Color.fromARGB(255, 198, 124, 78),
                  foregroundColor: Colors.white,
                  minimumSize: Size(220, 60),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double _calculatePrice(String selectedSize, coffeeType coffee) {
    double basePrice = double.parse(widget.coffee.detail[widget.index].price
        .replaceAll(' ', '')
        .substring(1));

    switch (selectedSize) {
      case 'S':
        return basePrice - 0.50;
      case 'M':
        return basePrice;
      case 'L':
        return basePrice + 0.50;
      default:
        return basePrice;
    }
  }
}
