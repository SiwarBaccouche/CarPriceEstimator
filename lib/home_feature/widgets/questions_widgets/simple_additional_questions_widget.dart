import 'package:flutter/material.dart';
import 'package:prixvoiture/core/utils/values/colors.dart';
import 'package:prixvoiture/home_feature/widgets/details_widgets/questionIndicator.dart';

import '../../../core/utils/values/styles.dart';
import '../../utils/models/carsExamples.dart';
import '../details_widgets/carBodyTypesWidget.dart';
import '../details_widgets/colorPicker_widget.dart';
import '../details_widgets/dropDownButton.dart';

class SimpleAdditionalQuestionsWidget extends StatefulWidget {
  const SimpleAdditionalQuestionsWidget({Key? key}) : super(key: key);

  @override
  State<SimpleAdditionalQuestionsWidget> createState() => _SimpleAdditionalQuestionsWidgetState();
}

class _SimpleAdditionalQuestionsWidgetState extends State<SimpleAdditionalQuestionsWidget> {

  String? selectedCarCondition;
  String? selectedCarStatus;

  @override
  Widget build(BuildContext context) {
    List<String> carCondition = [
      "New",
      "Used",
      "Certified pre-owned",
    ];
    List<String> carStatus = [
      "Clean",
      "Rebuilt",
      "Damaged",
    ];
    return Container(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Row(
              children: [
                QuestionIndicator(),
                SizedBox(width: 8),
                Text("Describe the car condition ?", style: questionTextStyle),
              ],
            ),

            CustomButtonList(
              items: carCondition,
              selectedItem: selectedCarCondition ?? "", // Adjust selectedItem
              onItemSelected: (condition) {
                setState(() {
                  selectedCarCondition = condition;
                });
              },
            ),


            SizedBox(height: 15),
            Row(
              children: [
                QuestionIndicator(),
                SizedBox(width: 8),
                Text(
                  "What is the status?",
                  style: questionTextStyle,
                ),
              ],
            ),
            SizedBox(height: 15),
            CustomButtonList(
              items: carStatus,
              selectedItem: selectedCarStatus?? "", // Adjust selectedItem
              onItemSelected: (condition) {
                setState(() {
                  selectedCarStatus = condition;
                });
              },
            ),
            SizedBox(height: 15),

          ],
        ),
      ),
    );
  }
}



