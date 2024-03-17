import 'package:flutter/material.dart';
import 'package:prixvoiture/core/utils/values/colors.dart';

import '../../../core/utils/values/styles.dart';

class SummaryCard extends StatefulWidget {
  const SummaryCard({Key? key}) : super(key: key);

  @override
  State<SummaryCard> createState() => _SummaryCardState();
}

class _SummaryCardState extends State<SummaryCard> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;
    return Container(
      height: size.height * 0.5,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
        border: Border.all(
          color: Colors.orange.withOpacity(0.5), // Orange border color
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.5), // Orange shadow color
            spreadRadius: 2, // Spread radius for a soft shadow
            blurRadius: 20, // Blur radius for a soft shadow
            offset: Offset(0, 2), // Offset for shadow (adjust as needed)
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "Summary",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: secondaryColor,
              ),
            ),
          ),
          Row(
            children: [
              Text(
                "Brand: ",
                style: ParagraphTextStyle,
              ),
              Text(
                "honda",
                style: ParagraphTextStyle,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Model: ",
                style: ParagraphTextStyle,
              ),
              Text(
                "civic ",
                style: ParagraphTextStyle,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Year: ",
                style: ParagraphTextStyle,
              ),
              Text(
                "2018 ",
                style: ParagraphTextStyle,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "BodyType: ",
                style: ParagraphTextStyle,
              ),
              Text(
                "anyType ",
                style: ParagraphTextStyle,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Fuel: ",
                style: ParagraphTextStyle,
              ),
              Text(
                "Diesel",
                style: ParagraphTextStyle,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Horsepower: ",
                style: ParagraphTextStyle,
              ),
              Text(
                "500 ",
                style: ParagraphTextStyle,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Gearbox: ",
                style: ParagraphTextStyle,
              ),
              Text(
                "manual ",
                style: ParagraphTextStyle,
              ),
            ],
          ),
          Container(
            height: 1.5, // Height of the separator (adjust as needed)
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.orange.withOpacity(0.5),
                  Colors.black
                ],
                begin: Alignment.centerLeft, // Start the gradient from the left
                end: Alignment.centerRight, // End the gradient on the right
              ),
            ),
          ),
          Row(
            children: [
              Text(
                "Price : ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: secondaryColor,
                ),
              ),
              Text(
                "57 millions DT ",
                style: ParagraphTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
