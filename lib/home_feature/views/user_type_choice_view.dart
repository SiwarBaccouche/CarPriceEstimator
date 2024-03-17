import 'package:flutter/material.dart';
import '../../core/utils/values/colors.dart';
import '../../core/utils/values/styles.dart';
import '../widgets/details_widgets/user_type_choice_button.dart';

class UserTypeChoicePage extends StatelessWidget {
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
            Text('Accuracy is our aim!', style: titleTextStyle),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0),
              child: Text(
                'Please select the purpose in order to have a more accurate estimation.',
                style: ParagraphTextStyle,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            UserTypeChoiceButton(
              icon: Icons.shopping_cart,
              onPressed: () {
                Navigator.pushNamed(context,'/estimationResult');
              },
            ),
            SizedBox(height: size.height * 0.01),
            Text(
              "Buy",
              style: questionTextStyle,
            ),
            SizedBox(height: size.height * 0.02),
            UserTypeChoiceButton(
              icon: Icons.car_crash_rounded,
              onPressed: () {
                print("ffffff");
              },
            ),
            SizedBox(height: size.height * 0.01),

            Text(
              "Sell",
              style: questionTextStyle,
            ),
            SizedBox(height: size.height * 0.02),
            UserTypeChoiceButton( // Use your user choice button widget here
              icon: Icons.info, // Change the icon as needed
              onPressed: () {
                print("ffffff");
              },
            ),
            SizedBox(height: size.height * 0.01),

            Text(
              "Just for information",
              style: questionTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
