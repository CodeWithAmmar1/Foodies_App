import 'package:app/Button/button.dart';

import 'package:app/HomeScreens/navbar.dart';

import 'package:app/model.dart';

import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  final String? name;
  final num? price;
  final String? resName;
  final String? image;

  const ProductItem(
      {super.key, this.name, this.price, this.resName, this.image});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/Frame 18.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 393,
                  width: 410,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25)),
                    image: DecorationImage(
                      image: NetworkImage(widget.image ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Container(
                    margin: EdgeInsets.only(top: 120, left: 20, right: 20),
                    child: Image.asset("assets/Frame 48095828.png")),
                SizedBox(
                  height: 10,
                ),
                Button(
                  insideText: "Add To Basket",
                  ontap: () {
                    setState(() {
                      cartData.add(CartModel(
                          image: widget.image ?? "",
                          title: widget.name ?? "",
                          count: count,
                          price: widget.price ?? 0,
                          resname: widget.resName ?? ""));
                    });
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNavigation(
                                  initialIndex: 1,
                                )));
                  },
                )
              ],
            ),
            Positioned(
              child: Container(
                height: 270,
                width: 400,
                margin: EdgeInsets.only(top: 300, left: 20, right: 20),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.4)
                    ]),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 20),
                      child: Text(
                        widget.name ?? "",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        "${widget.price}",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Our Udon Miso is a comforting bowl of \nthick, handmade udon noodles in a rich\nmiso broth, garnished with tofu, spring \nonions, and vegetables.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 120,
                            height: 38,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Color(0xff6562FBC4))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (count > 1) {
                                        count--;
                                      }
                                    });
                                  },
                                  child: Container(
                                      margin: EdgeInsets.only(
                                        bottom: 15,
                                      ),
                                      child: Icon(Icons.minimize_outlined,
                                          color: Colors.white)),
                                ),
                                Text(
                                  "$count",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        count++;
                                      });
                                    },
                                    child:
                                        Icon(Icons.add, color: Colors.white)),
                                // SizedBox(
                                //   width: 10,
                                // ),
                              ],
                            ),
                          )
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
    );
  }
}
