import 'dart:ui';
import 'package:app/HomeScreens/cart.dart';
import 'package:app/HomeScreens/home_screen.dart';
import 'package:app/HomeScreens/my_order.dart';
import 'package:app/HomeScreens/my_profile.dart';
import 'package:app/HomeScreens/product.dart';

import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  final int initialIndex;
  const BottomNavigation({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  late int currentindex;

  @override
  void initState() {
    super.initState();
    currentindex = widget.initialIndex;
  }

  final screens = [Homescreen(), Cart(), MyOrder(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          IndexedStack(
            children: screens,
            index: currentindex,
          ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width * 0.90,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.1),
                          blurRadius: 20,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: SafeArea(
                      child: BottomNavigationBar(
                        type: BottomNavigationBarType.fixed,
                        backgroundColor: Colors.transparent,
                        selectedItemColor: Colors.blue,
                        unselectedItemColor: Colors.grey,
                        onTap: (index) {
                          setState(() {
                            currentindex = index;
                          });
                        },
                        currentIndex: currentindex,
                        items: const [
                          BottomNavigationBarItem(
                              icon: Icon(Icons.home), label: "Home"),
                          BottomNavigationBarItem(
                              icon: Icon(Icons.shopping_cart), label: "Cart"),
                          BottomNavigationBarItem(
                              icon: Icon(Icons.favorite), label: "Favorite"),
                          BottomNavigationBarItem(
                              icon: Icon(Icons.person), label: "Profile"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
