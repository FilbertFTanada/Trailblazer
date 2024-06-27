import 'package:flutter/material.dart';

class CoffeeType extends StatelessWidget {
  final String coffeetype;
  final bool isSelected;
  final VoidCallback onTap;

  CoffeeType({
    required this.coffeetype,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            margin: EdgeInsets.only(top: 10, right: 5),
            child: TextButton(
                onPressed: onTap,
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    backgroundColor: isSelected
                        ? Color.fromARGB(1000, 198, 124, 78)
                        : Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 20)),
                child: Text(
                  coffeetype,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : Colors.black),
                ))));
  }
}
