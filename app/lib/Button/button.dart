import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final void Function() ontap;
  final String insideText;

  const Button({
    super.key,
    required this.ontap,
    required this.insideText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 254,
        height: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color(0xff0F55E8).withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: ontap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Color(0xff0F55E8), width: 2),
            ),
          ),
          child: Text(
            insideText,
            style: TextStyle(
                fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
