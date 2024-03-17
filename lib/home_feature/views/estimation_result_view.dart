import 'package:flutter/material.dart';
import 'package:prixvoiture/home_feature/widgets/stats_widgets/priceChartWidget.dart';

import '../../core/utils/values/colors.dart';
import '../widgets/stats_widgets/recapCard_widget.dart';

class EstimationResults extends StatelessWidget {
  const EstimationResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;
    return SafeArea(
        child: Scaffold(
            backgroundColor: primaryColor,
            body: SingleChildScrollView(
              child: Padding( padding: EdgeInsets.only(top:30, bottom: 30),
      child: Center(
        child: Column( mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SummaryCard(),
            SizedBox(height: 30),
            PriceChartWidget(),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/quiz_choice');
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
                    "Done",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    ),
            )));
  }
}
