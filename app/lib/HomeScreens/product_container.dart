import 'dart:ui';

import 'package:flutter/material.dart';

class Productcontainer extends StatefulWidget {
  final String name;
  final String image;
  final num price;
  const Productcontainer(
      {super.key,
      required this.name,
      required this.image,
      required this.price});

  @override
  State<Productcontainer> createState() => _ProductcontainerState();
}

class _ProductcontainerState extends State<Productcontainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        width: 353,
        height: 136,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.white.withOpacity(0.2)),
            color: Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 0,
                offset: Offset(0, 5),
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30, right: 10, top: 20),
                  child: Text(
                    "${widget.name}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 10, bottom: 20),
                  child: Text(
                    "\$${widget.price}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: Colors.white.withOpacity(0.2)),
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.image,
                    ),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle),
            ),
          ],
        ),
      ),
    );
  }
}
