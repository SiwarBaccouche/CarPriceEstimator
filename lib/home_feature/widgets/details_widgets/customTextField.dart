import 'package:flutter/material.dart';

import '../../../core/utils/values/colors.dart';
class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final bool isObscureText;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  CustomTextField({
    required this.hintText,
    required this.prefixIcon,
    required this.controller, // Accept TextEditingController
    this.isObscureText = false,
    this.onChanged, // Accept onChanged callback
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;
    final OutlineInputBorder customBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide(color: secondaryColor),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          hintText,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.normal,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
        SizedBox(height: 5),
        Container(
          width: size.width * 0.8,
          child: TextFormField(
            controller: controller, // Assign the provided controller
            onChanged: onChanged, // Assign the provided onChanged callback
            style: TextStyle(
              color: Colors.white,
              // Set the text color to white
            ),
            decoration: InputDecoration(
              hintText: hintText,
              enabledBorder: customBorder,
              focusedBorder: customBorder,
              prefixIcon: Icon(prefixIcon),
            ),
            obscureText: isObscureText,
          ),
        ),
      ],
    );
  }
}