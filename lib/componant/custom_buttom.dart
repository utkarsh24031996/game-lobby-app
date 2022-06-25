import 'package:flutter/material.dart';

import '../constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key, required this.ontap, required this.color, required this.text})
      : super(key: key);
  final VoidCallback ontap;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        height: scHeight(context) * 0.065,
        // width: scWidth(context) / 1.2,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
