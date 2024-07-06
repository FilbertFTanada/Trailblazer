import 'package:Trailblazer_Flutter/pages/chatbot/chatbot.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:Trailblazer_Flutter/pages/settings/Setting.dart';
import 'package:Trailblazer_Flutter/util/coffe_type.dart';
import 'package:Trailblazer_Flutter/util/coffee_tiles.dart';
import 'package:Trailblazer_Flutter/util/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<List<dynamic>> coffeetype = [
    ['Cappuccino', true],
    ['Machiato', false],
    ['Latte', false],
    ['Americano', false]
  ];

  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeetype.length; i++) {
        coffeetype[i][1] = false;
      }
      coffeetype[index][1] = true;
    });
  }

  int indexPassing = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(1000, 10, 10, 10),
                      Color.fromARGB(1000, 19, 19, 19)
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      margin: EdgeInsets.only(left: 30, right: 30, top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Location",
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  "Sumatera Utara",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          PopupMenuButton<int>(
                            onSelected: (value) {
                              if (value == 1) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SettingPage()));
                              } else {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Chatbot()));
                              }
                            },
                            itemBuilder: (context) => [
                              PopupMenuItem<int>(
                                value: 1,
                                child: Text('Setting'),
                              ),
                              PopupMenuItem<int>(
                                value: 2,
                                child: Text('Chatbot'),
                              ),
                            ],
                            child: Container(
                              width: 50,
                              height: 40,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: const Icon(
                                  Icons.menu,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      margin:
                          const EdgeInsets.only(top: 30, right: 30, left: 30),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 50, 50, 50),
                                  Color.fromARGB(255, 60, 60, 60)
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight)),
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(top: 10, left: 0),
                            border: InputBorder.none,
                            hintText: "Search Coffee",
                            icon: Padding(
                              padding: const EdgeInsets.only(left: 15, top: 0),
                              child: Icon(Icons.search_rounded,
                                  color: Colors.white.withOpacity(0.8)),
                            ),
                            suffixIcon: Container(
                                width: 40,
                                height: 50,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    color: const Color.fromARGB(
                                        1000, 198, 124, 78),
                                    child: const Icon(
                                      Icons.manage_history_outlined,
                                    ),
                                  ),
                                )),
                            suffixIconColor: Colors.white70,
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 150, 150, 150),
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 30, right: 30, top: 30),
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                          image: const DecorationImage(
                            image: AssetImage(
                                "assets/kopi.png"), // replace with your image path
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 2),
                                    child: const Text(
                                      "Promo",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    "Buy one get",
                                    style: TextStyle(
                                      color: Colors.white,
                                      backgroundColor: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    "One FREE",
                                    style: TextStyle(
                                      color: Colors.white,
                                      backgroundColor: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // white background section
              Container(
                height: 370,
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: coffeetype.length,
                        itemBuilder: (context, index) {
                          return CoffeeType(
                            coffeetype: coffeetype[index][0],
                            isSelected: coffeetype[index][1],
                            onTap: () {
                              coffeeTypeSelected(index);
                              setState(() {
                                indexPassing = index;
                              });
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 15),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.6,
                          crossAxisSpacing: 20,
                        ),
                        itemCount: Provider.of<CoffeeNewProvider>(context)
                            .coffee[indexPassing]
                            .detail
                            .length,
                        itemBuilder: (BuildContext context, int index) {
                          CoffeeNewProvider coffeeProvider =
                              Provider.of<CoffeeNewProvider>(context);
                          coffeeType coffee =
                              coffeeProvider.coffee[indexPassing];
                          return coffeeTile(
                              coffee_param: coffee, indexCoffee: index);
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
