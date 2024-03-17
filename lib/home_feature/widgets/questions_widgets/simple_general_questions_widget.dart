import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prixvoiture/core/utils/values/colors.dart';
import 'package:prixvoiture/home_feature/widgets/details_widgets/questionIndicator.dart';

import '../../../core/utils/values/styles.dart';
import '../../utils/models/carsExamples.dart';
import '../details_widgets/dropDownButton.dart';

class SimpleGeneralQuestionsWidget extends StatefulWidget {
  final Function(String?, String?) onSelectValues;

  const SimpleGeneralQuestionsWidget({Key? key, required this.onSelectValues}) : super(key: key);

  @override
  State<SimpleGeneralQuestionsWidget> createState() =>
      _SimpleGeneralQuestionsWidgetState();
}

class _SimpleGeneralQuestionsWidgetState
    extends State<SimpleGeneralQuestionsWidget> {
  String? brandDropdownValue;
  String? modelDropdownValue;

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
                  widget.onSelectValues(brandDropdownValue, modelDropdownValue);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
