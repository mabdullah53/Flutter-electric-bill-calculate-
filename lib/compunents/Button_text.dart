import 'package:electricitybill_calculate/compunents/colous.dart';
import 'package:flutter/material.dart';

class CreativeText extends StatelessWidget {
  String title;
   CreativeText({super.key ,required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title,
      style: TextStyle(
        fontSize: 18,
        color: AppColour.WhiteColour,
        fontWeight: FontWeight.w600
      ) ,
    );
  }
}
