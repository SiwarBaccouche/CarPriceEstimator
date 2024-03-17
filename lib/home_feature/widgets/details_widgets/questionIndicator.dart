import 'package:flutter/material.dart';

import '../../../core/utils/values/colors.dart';

class QuestionIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20, // Adjust the size of the indicator as needed
      height: 20, // Adjust the size of the indicator as needed
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: secondaryColor,
      ),
      child: Center(
        child:Container(
      width: 9, // Adjust the size of the indicator as needed
    height: 9, // Adjust the size of the indicator as needed
    decoration: BoxDecoration(
    shape: BoxShape.circle,
    color: primaryColor,
    ),
      ),),
    );
  }
}
