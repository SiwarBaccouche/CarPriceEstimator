import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prixvoiture/core/utils/values/colors.dart';
import 'package:prixvoiture/home_feature/widgets/details_widgets/questionIndicator.dart';

import '../../../core/utils/values/styles.dart';
import '../../utils/models/carsExamples.dart';
import '../details_widgets/dropDownButton.dart';

class GeneralQuestionsWidget extends StatefulWidget {
  final Function(String?, String?, String?) onSelectValues;

  const GeneralQuestionsWidget({Key? key, required this.onSelectValues}) : super(key: key);

  @override
  State<GeneralQuestionsWidget> createState() => _GeneralQuestionsWidgetState();
}

class _GeneralQuestionsWidgetState extends State<GeneralQuestionsWidget> {

  String? brandDropdownValue;
  String? modelDropdownValue;
  String? yearDropdownValue;
  String? versionDropdownValue;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;
    final OutlineInputBorder customBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide(color: secondaryColor),
    );
    return Container(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Row(
              children: [
                QuestionIndicator(),
                SizedBox(width: 8),
                Text("What is the brand of the car ?",
                    style: questionTextStyle),
              ],
            ),
            SizedBox(height: 15),
            DropdownMenuExample(
              value: brandDropdownValue,
              items: carModels.map((car) => car.brand!).toSet().toList(),
              onChanged: (String? newValue) {
                setState(() {
                  brandDropdownValue = newValue;
                  versionDropdownValue = null;

                  if (brandDropdownValue != null) {
                    final validModels = carModels
                        .where((car) => car.brand == brandDropdownValue)
                        .map((car) => car.model)
                        .toSet()
                        .toList();

                    if (!validModels.contains(modelDropdownValue)) {
                      modelDropdownValue = null;
                    }
                  }
                });
              },
            ),
            SizedBox(height: 15),
            Row(
              children: [
                QuestionIndicator(),
                SizedBox(width: 8),
                Text(
                  "What is the model ?",
                  style: questionTextStyle,
                ),
              ],
            ),
            SizedBox(height: 15),
            DropdownMenuExample(
              value: modelDropdownValue,
              items: carModels
                  .where((car) =>
                      brandDropdownValue == null ||
                      car.brand == brandDropdownValue)
                  .map((car) => car.model!)
                  .toSet()
                  .toList(),
              onChanged: (String? newValue) {
                setState(() {
                  modelDropdownValue = newValue;
                });
              },
            ),
            SizedBox(height: 15),
            Row(
              children: [
                QuestionIndicator(),
                SizedBox(width: 8),
                Text(
                  "Which version ?",
                  style: questionTextStyle,
                ),
              ],
            ),
            SizedBox(height: 15),
            DropdownMenuExample(
              value: versionDropdownValue,
              items: carModels
                  .where((car) =>
              (brandDropdownValue == null ||
                  car.brand == brandDropdownValue) &&
                  (modelDropdownValue == null ||
                      car.model == modelDropdownValue))
                  .map((car) => car.version ?? "")
                  .toSet()
                  .toList(),
              onChanged: (String? newValue) {
                setState(() {

                  // Check if the selected version exists for the new brand and model
                  final isValidVersion = carModels.any((car) =>
                  car.brand == brandDropdownValue &&
                      car.model == modelDropdownValue &&
                      car.version == newValue);

                  // Update versionDropdownValue only if the selected version is valid
                  versionDropdownValue = isValidVersion ? newValue : null;
                  widget.onSelectValues(brandDropdownValue, modelDropdownValue, versionDropdownValue);
                });
              },
            ),

            SizedBox(height: 15),
            Row(
              children: [
                QuestionIndicator(),
                SizedBox(width: 8),
                Text(
                  "What is the registration year ?",
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
//year picker
          ],
        ),
      ),
    );
  }
}
