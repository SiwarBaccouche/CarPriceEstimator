import 'package:flutter/material.dart';
import 'package:prixvoiture/core/utils/values/colors.dart';
import 'package:prixvoiture/home_feature/widgets/details_widgets/questionIndicator.dart';

import '../../../core/utils/values/styles.dart';
import '../../utils/models/carsExamples.dart';
import '../details_widgets/carBodyTypesWidget.dart';
import '../details_widgets/colorPicker_widget.dart';
import '../details_widgets/dropDownButton.dart';

class AdditionalQuestionsWidget extends StatefulWidget {
  const AdditionalQuestionsWidget({Key? key}) : super(key: key);

  @override
  State<AdditionalQuestionsWidget> createState() => _AdditionalQuestionsWidgetState();
}

class _AdditionalQuestionsWidgetState extends State<AdditionalQuestionsWidget> {

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
            Row(
              children: [
                QuestionIndicator(),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "What is the paint color ? (select the + sign if the color is special)",
                    style: questionTextStyle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

              ],
            ),
            SizedBox(height: 15),
      CarColorPicker(
        colors: [
          Colors.black,
          Colors.white,
          Colors.grey,
          Colors.red,
          Colors.indigo,
          Colors.green,
            ],
        onColorSelected: (color) {
          // Handle the selected color here
        },),
//year picker
          ],
        ),
      ),
    );
  }
}



