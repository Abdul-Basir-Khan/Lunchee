import 'package:flutter/material.dart';

import '../constant/reusable_text.dart';


class CustomContainer extends StatelessWidget {


  final String date;
  final String day;
  final Color borderColor;
  final Color containerColor;
  final Color dateColor;
  final Color dayColor;

  const CustomContainer({super.key, required this.date, required this.day, required this.borderColor, required this.containerColor, required this.dateColor, required this.dayColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,width: 65,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: borderColor),
        color: containerColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ReusableText(
            title: date,
            size: 16,
            weight: FontWeight.w600,
            color: dateColor,
          ),
          SizedBox(height: 6,),
          ReusableText(
            title: day,
            size: 16,
            weight: FontWeight.w600,
            color: dayColor,
          ),

        ],
      ),
    );
  }
}
