import 'package:flutter/material.dart';

class Cartcontainer extends StatelessWidget {
  final String name;
  final num price;

  final String image;
  final int quantityCount;
  final void Function() onTapCancel;
  final void Function() onAdd;
  final void Function() onSub;
  const Cartcontainer(
      {super.key,
      required this.name,
      required this.price,
      required this.image,
      required this.quantityCount,
      required this.onTapCancel,
      required this.onAdd,
      required this.onSub});

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
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: Colors.white.withOpacity(0.2)),
                  image: DecorationImage(
                    image: NetworkImage(
                      image,
                    ),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle),
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, right: 10, top: 10),
                  child: Text(
                    name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 10, top: 10),
                  child: Text(
                    "\$$price",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: 100,
                  height: 32,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xff6562FBC4))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: onSub,
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        "$quantityCount",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                          onTap: onAdd,
                          child: Icon(Icons.add, color: Colors.white)),
                      // SizedBox(
                      //   width: 10,
                      // ),
                    ],
                  ),
                ),
              ],
            ),
            GestureDetector(
                onTap: onTapCancel,
                child: Container(
                    margin: EdgeInsets.only(left: 40, bottom: 60),
                    child: Icon(Icons.cancel_outlined,
                        size: 30, color: Colors.white))),
          ],
        ),
      ),
    );
  }
}
