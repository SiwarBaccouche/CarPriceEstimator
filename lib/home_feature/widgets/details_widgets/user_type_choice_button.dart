import 'package:flutter/material.dart';

import '../../../core/utils/values/colors.dart';

class UserTypeChoiceButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  UserTypeChoiceButton({
    required this.icon,
    required this.onPressed,
  });

  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;
    return Container(
      width: size.width * 0.25,
      height: size.width * 0.25,
      decoration: BoxDecoration(
        color: primaryColor,
        border: Border.all(color: secondaryColor, width: 1),
        borderRadius: BorderRadius.circular(60),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          elevation: 5,
          shadowColor: secondaryColor,
        ),
        onPressed: () {
          onPressed();
        },
        child: Icon(
          icon,
          color: secondaryColor,
          size: 48,
        ),
      ),
    );
  }
}
