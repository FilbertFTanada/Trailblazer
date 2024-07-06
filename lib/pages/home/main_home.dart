import 'package:flutter/material.dart';
import 'package:Trailblazer_Flutter/pages/buttombarpage/Fav_Screen.dart';
import 'package:Trailblazer_Flutter/pages/buttombarpage/Home_Screen.dart';
import 'package:Trailblazer_Flutter/pages/buttombarpage/Notif_Screen.dart';
import 'package:Trailblazer_Flutter/pages/buttombarpage/Shop_Screen.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  List<Widget> widgets = [
    const HomeScreen(),
    FavScreen(),
    const ShopScreen(),
    const NotifScreen()
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgets[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        currentIndex: currentIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.orange,
        iconSize: 24,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "",
          ),
        ],
      ),
    );
  }
}
