import 'package:app/Button/button.dart';
import 'package:app/HomeScreens/cart_container.dart';

import 'package:app/HomeScreens/order.dart';
import 'package:app/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  final String? resName;
  const Cart({
    super.key,
    this.resName,
  });

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  num totalPrice = 0;

  @override
  void initState() {
    super.initState();
    for (var element in cartData) {
      num total = element.count * element.price;
      totalPrice += total;
    }
    setState(() {});
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Frame 18.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.all(30),
                  child: Text(
                    "My Cart",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: Colors.grey.shade300),
                  ),
                ),
              ),
              SizedBox(
                height: 600,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: cartData.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = cartData[index];

                    return Cartcontainer(
                        onAdd: () {
                          cartData[index].count += 1;
                          totalPrice = 0;
                          for (var element in cartData) {
                            num total = element.count * element.price;
                            totalPrice += total;
                          }
                          setState(() {});
                        },
                        onSub: () {
                          if (cartData[index].count > 1) {
                            cartData[index].count -= 1;
                          }
                          totalPrice = 0;
                          for (var element in cartData) {
                            num total = element.count * element.price;
                            totalPrice += total;
                          }
                          setState(() {});
                        },
                        onTapCancel: () {
                          cartData.removeAt(index);
                          totalPrice = 0;
                          for (var element in cartData) {
                            num total = element.count * element.price;
                            totalPrice += total;
                          }
                          setState(() {});
                        },
                        quantityCount: item.count,
                        name: item.title,
                        price: item.price,
                        image: item.image);
                  },
                ),
              ),
              const Spacer(),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 120),
                  width: 364,
                  height: 67,
                  child: Button(
                    insideText: "Check Out",
                    ontap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              decoration:
                                  BoxDecoration(color: Color(0xff1D102D)),
                              width: double.infinity,
                              height: 450,
                              margin: EdgeInsets.only(top: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child: Text(
                                          "Checkout",
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 20),
                                        child: Icon(
                                          Icons.cancel_outlined,
                                          size: 40,
                                          color: Color(0xffB3B3B3),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        top: BorderSide(
                                            width: 1.0,
                                            color: Colors.grey.shade300),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Subtotal",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff7C7C7C)),
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "\$${totalPrice.toStringAsFixed(2)}   ",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        Icon(Icons.arrow_forward_ios),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        top: BorderSide(
                                            width: 1.0,
                                            color: Colors.grey.shade300),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Delivery Fees",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff7C7C7C)),
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "\$2.1 ",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        Icon(Icons.arrow_forward_ios),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        top: BorderSide(
                                            width: 1.0,
                                            color: Colors.grey.shade300),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Total Cost",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff7C7C7C)),
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "\$${(totalPrice + 2.1).toStringAsFixed(2)} ",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        Icon(Icons.arrow_forward_ios),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 20),
                                    child: RichText(
                                      text: TextSpan(
                                        text:
                                            'By placing an order you agree to our\n',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff7C7C7C)),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Terms',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                          TextSpan(
                                            text: ' And ',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff7C7C7C),
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'Conditions',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(top: 30, bottom: 20),
                                      width: 364,
                                      height: 67,
                                      child: Button(
                                        insideText: "Place Order",
                                        ontap: () async {
                                          List products = cartData
                                              .map((item) => item.title)
                                              .toList();
                                          List quantity = cartData
                                              .map((item) => item.count)
                                              .toList();
                                          List resName = cartData
                                              .map((item) => item.resname)
                                              .toList();
                                          Map<String, dynamic> order = {
                                            "Resturant": resName,
                                            "product": products,
                                            "quantity": quantity,
                                            "total": totalPrice,
                                          };

                                          await firestore
                                              .collection("order")
                                              .add(order);
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Orderplace()));
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          enableDrag: true,
                          isScrollControlled: false,
                          isDismissible: true,
                          backgroundColor: Color(0xff1D102D),
                          barrierColor: Colors.black.withOpacity(0.1));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
