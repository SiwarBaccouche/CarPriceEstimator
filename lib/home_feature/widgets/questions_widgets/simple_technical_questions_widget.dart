import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prixvoiture/core/utils/values/colors.dart';
import 'package:prixvoiture/home_feature/widgets/details_widgets/carBodyTypesWidget.dart';
import 'package:prixvoiture/home_feature/widgets/details_widgets/questionIndicator.dart';

import '../../../core/utils/values/styles.dart';
import '../../utils/models/carsExamples.dart';
import '../details_widgets/dropDownButton.dart';

class SimpleTechnicalQuestionsWidget extends StatefulWidget {
  final String? brand;
  final String? model;


  const SimpleTechnicalQuestionsWidget({
    Key? key,
    this.brand,
    this.model,
  }) : super(key: key);
  @override
  State<SimpleTechnicalQuestionsWidget> createState() =>
      TechnicalQuestionsWidgetState();
}

class TechnicalQuestionsWidgetState
    extends State<SimpleTechnicalQuestionsWidget> {
  String selectedFuelType = "";
  String selectedCarBodyType = "";
  String selectedGearboxType = "";

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;
    final OutlineInputBorder customBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide(color: secondaryColor),
    );

    List<String> fuelTypes = ["Diesel", "Gasoline", "Electricity", "Hybride"];
    List<String> filterFuelTypes() {
      return carModels
          .where((car) =>
      (widget.brand == null || car.brand == widget.brand) &&
          (widget.model == null || car.model == widget.model) )
          .map((car) => car.fuel)
          .where((fuel) => fuel != null) // Filter out null values
          .map((fuel) => fuel!) // Convert nullable strings to non-nullable
          .toSet()
          .toList();
    }

    return Container(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Row(
              children: [
                QuestionIndicator(),
                SizedBox(width: 8),
                Text(
                  "What type of fuel does it run on?",
                  style: questionTextStyle,
                ),
              ],
            ),
            SizedBox(height: 15),
            CustomButtonList(
              items: filterFuelTypes(),
              selectedItem: selectedFuelType,
              onItemSelected: (type) {
                setState(() {
                  selectedFuelType = type;
                });
              },
            ),
            SizedBox(height: 15),
            Row(
              children: [
                QuestionIndicator(),
                SizedBox(width: 8),
                Text(
                  "What is the horsepower ?",
                  style: questionTextStyle,
                ),
              ],
            ),
            SizedBox(height: 15),
            Container(
              width: size.width * 0.7,
              child: TextField(
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  enabledBorder: customBorder,
                  focusedBorder: customBorder,
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                QuestionIndicator(),
                SizedBox(width: 8),
                Text(
                  "How many Kilometers did it go ?",
                  style: questionTextStyle,
                ),
              ],
            ),
            SizedBox(height: 15),
            Container(
              width: size.width * 0.7,
              child: TextField(
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  enabledBorder: customBorder,
                  focusedBorder: customBorder,
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
