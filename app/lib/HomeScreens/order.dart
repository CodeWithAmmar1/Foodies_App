import 'package:app/Button/button.dart';
import 'package:app/HomeScreens/navbar.dart';
import 'package:app/model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Orderplace extends StatefulWidget {
  const Orderplace({super.key});

  @override
  State<Orderplace> createState() => _OrderplaceState();
}

class _OrderplaceState extends State<Orderplace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Frame 18.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Colors.black, width: 2), // Optional border styling
                ),
                child: ClipOval(
                  child: Lottie.asset(
                    'assets/animations/confirm.json',
                    fit: BoxFit
                        .cover, // or BoxFit.contain based on your preference
                    repeat: true,
                    reverse: false,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                "Your Order has been\n          accepted",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                "Your items have been placed and are on\n           their way to being processed",
                style: TextStyle(fontSize: 16, color: Color(0xff7C7C7C)),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 250, bottom: 20),
                width: 200,
                height: 67,
                child: Button(
                  insideText: "Check Your Order",
                  ontap: () {
                    setState(() {
                      cartData.clear();
                    });
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNavigation(
                                  initialIndex: 2,
                                )));
                  },
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
