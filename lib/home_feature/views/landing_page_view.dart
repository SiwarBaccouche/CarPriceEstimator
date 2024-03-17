import 'package:flutter/material.dart';
import '../../../core/utils/values/colors.dart';
import '../../../core/utils/common_functions.dart';
import '../../core/utils/values/styles.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.15),
            ),
            Text("PRIXVOITURE", style: titleTextStyle),
            SizedBox(height: 10),
            Text("Get Accurate Car Price Estimates Instantly",
                style: ParagraphTextStyle),
            SizedBox(height: 10),
            Image.asset(
              'assets/landing_pic.jpg',
              width: size.width,
              height: size.height * 0.4,
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                primary: secondaryColor,
                fixedSize: Size(size.width * 0.5, size.height * 0.07),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                elevation: 5,
                shadowColor: secondaryColor,
              ),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Estimate",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
