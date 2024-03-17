import 'package:flutter/material.dart';
import 'package:prixvoiture/core/utils/values/styles.dart';
import '../../../core/utils/values/colors.dart';


class QuizChoicePage extends StatelessWidget {
  const QuizChoicePage({Key? key}) : super(key: key);

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
            Text(
              "The choice is yours!",
              style: titleTextStyle,
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left:30.0,right: 30.0),
              child: RichText(
                text: TextSpan(
                  style: ParagraphTextStyle,
                  children: <TextSpan>[
                    TextSpan(
                      text: "You can go through a ",
                    ),
                    TextSpan(
                      text: "simple",
                      style: TextStyle(
                        color: secondaryColor,
                      ),
                    ),
                    TextSpan(
                      text: " and ",
                    ),
                    TextSpan(
                      text: "quick",
                      style: TextStyle(
                        color: secondaryColor,
                      ),
                    ),
                    TextSpan(
                      text: " quiz or you can choose the ",
                    ),
                    TextSpan(
                      text: "detailed",
                      style: TextStyle(
                        color: secondaryColor,
                      ),
                    ),
                    TextSpan(
                      text: " and ",
                    ),
                    TextSpan(
                      text: "profound",
                      style: TextStyle(
                        color: secondaryColor,
                      ),
                    ),
                    TextSpan(
                      text: " quiz in order to get a more accurate estimation.",
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 10),
            Image.asset(
              'assets/landing_pic.jpg',
              width: size.width,
              height: size.height * 0.4,
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/SimpleQuiz');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: secondaryColor,
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
                  "Simple ",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/DetailedQuiz');
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
                  "Detailed ",
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
