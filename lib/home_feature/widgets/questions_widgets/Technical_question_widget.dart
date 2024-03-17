import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prixvoiture/core/utils/values/colors.dart';
import 'package:prixvoiture/home_feature/widgets/details_widgets/carBodyTypesWidget.dart';
import 'package:prixvoiture/home_feature/widgets/details_widgets/questionIndicator.dart';

import '../../../core/utils/values/styles.dart';
import '../../utils/models/carsExamples.dart';


class TechnicalQuestionsWidget extends StatefulWidget {
  final String? brand;
  final String? model;
  final String? version;

  const TechnicalQuestionsWidget({
    Key? key,
    this.brand,
    this.model,
    this.version,
  }) : super(key: key);

  @override
  State<TechnicalQuestionsWidget> createState() =>
      TechnicalQuestionsWidgetState();
}

class TechnicalQuestionsWidgetState extends State<TechnicalQuestionsWidget> {
  String selectedFuelType = "";
  String selectedCarBodyType = "";
  String selectedGearboxType = "";
  String selectedDriveType="";
  int? selectedCylinderNumber;
  List<String> filterFuelTypes() {
    return carModels
        .where((car) =>
    (widget.brand == null || car.brand == widget.brand) &&
        (widget.model == null || car.model == widget.model) &&
        (widget.version == null || car.version == widget.version))
        .map((car) => car.fuel)
        .where((fuel) => fuel != null) // Filter out null values
        .map((fuel) => fuel!) // Convert nullable strings to non-nullable
        .toSet()
        .toList();
  }

  List<String> filterCarBodyTypes() {
    return carModels
        .where((car) =>
    (widget.brand == null || car.brand == widget.brand) &&
        (widget.model == null || car.model == widget.model) &&
        (widget.version == null || car.version == widget.version))
        .map((car) => car.bodyType)
        .where((bodyType) => bodyType != null) // Filter out null values
        .map((bodyType) => bodyType!) // Convert nullable strings to non-nullable
        .toSet()
        .toList();
  }

  List<String> filterGearboxTypes() {
    return carModels
        .where((car) =>
    (widget.brand == null || car.brand == widget.brand) &&
        (widget.model == null || car.model == widget.model) &&
        (widget.version == null || car.version == widget.version))
        .map((car) => car.gearbox)
        .where((gearbox) => gearbox != null) // Filter out null values
        .map((gearbox) => gearbox!) // Convert nullable strings to non-nullable
        .toSet()
        .toList();
  }

  List<int> filterCylinders() {
    return carModels
        .where((car) =>
    (widget.brand == null || car.brand == widget.brand) &&
        (widget.model == null || car.model == widget.model) &&
        (widget.version == null || car.version == widget.version))
        .map((car) => car.cylinders ?? 0) // Handle nullable int values by providing a default value
        .toSet()
        .toList();
  }

  List<String> filterDriveTypes() {
    return carModels
        .where((car) =>
    (widget.brand == null || car.brand == widget.brand) &&
        (widget.model == null || car.model == widget.model) &&
        (widget.version == null || car.version == widget.version))
        .map((car) => car.drive)
        .where((drive) => drive != null)
        .map((drive) => drive!)
        .toSet()
        .toList();
  }




  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;
    final OutlineInputBorder customBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide(color: secondaryColor),
    );
    List<String> carBodyTypes = [
      "Sedan",
      "SUV",
      "Hatchback",
      "Coupé",
      "Convertible",
      "Cabriolet",
      "Van"
    ];
    List<String> gearBoxTypes = ["Automatic", "Manual"];
    List<String> fuelTypes = ["Diesel", "Gasoline", "Electricity", "Hybride"];
    List<int> cylindersNumber = [4,0,6];
    List<String>   driveTypes = ["AWD", "FWD"];



    return Container(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Row(
              children: [
                QuestionIndicator(),
                SizedBox(width: 8),
                Text("What is the car  body type?", style: questionTextStyle),
              ],
            ),
            SizedBox(height: 15),
            CustomButtonList(
              items:filterCarBodyTypes(),
              selectedItem: selectedCarBodyType,
              onItemSelected: (type) {
                setState(() {
                  selectedCarBodyType = type;

                });
              },
            ),
            SizedBox(height: 15),
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
                  "How many cylinders ?",
                  style: questionTextStyle,
                ),
              ],
            ),
            SizedBox(height: 15),
            CustomButtonList(
              items: filterCylinders().map((number) => number.toString()).toList(),
              selectedItem: selectedCylinderNumber.toString(),
              onItemSelected: (number) {
                setState(() {
                  selectedCylinderNumber = int.parse(number);
                });
              },
            ),
            SizedBox(height: 15),
            Row(
              children: [
                QuestionIndicator(),
                SizedBox(width: 8),
                Text(
                  "What is the gearbox type ?",
                  style: questionTextStyle,
                ),
              ],
            ),
            CustomButtonList(
              items: filterGearboxTypes(),
              selectedItem: selectedGearboxType,
              onItemSelected: (type) {
                setState(() {
                  selectedGearboxType = type;
                });
              },
            ),
            SizedBox(height: 15),
            Row(
              children: [
                QuestionIndicator(),
                SizedBox(width: 8),
                Text(
                  "What is the drive ?",
                  style: questionTextStyle,
                ),
              ],
            ),
            CustomButtonList(
              items: filterDriveTypes(),
              selectedItem: selectedDriveType,
              onItemSelected: (type) {
                setState(() {
                  selectedDriveType = type;
                });
              },
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
