import 'package:flutter/material.dart';
import 'package:prixvoiture/core/utils/values/colors.dart';
import 'package:prixvoiture/home_feature/views/user_type_choice_view.dart';

import '../widgets/questions_widgets/Technical_question_widget.dart';
import '../widgets/questions_widgets/additional_questions_widget.dart';
import '../widgets/questions_widgets/general_questions_widgets.dart';
import 'estimation_result_view.dart';

class DetailedQuiz extends StatefulWidget {
  const DetailedQuiz({Key? key}) : super(key: key);

  @override
  _DetailedQuizState createState() => _DetailedQuizState();
}

class _DetailedQuizState extends State<DetailedQuiz> {
  int _index = 0;
  String? brandValue;
  String? modelValue;
  String? versionValue;

  void _handleBrandModelSelection(String? brand, String? model, String? version) {
    setState(() {
      brandValue = brand;
      modelValue = model;
      versionValue = version;
      print('Selected brand: $brand');
      print('Selected model: $model');
      print('Selected version: $version');
       });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Column(
          children: <Widget>[
            Expanded(
              child: Stepper(
                currentStep: _index,
                onStepCancel: () {
                  if (_index > 0) {
                    setState(() {
                      _index -= 1;
                    });
                  }

                },
                onStepContinue: () {
                  if (_index < 2) {
                    setState(() {
                      _index += 1;
                    });
                  }else {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                       // builder: (context) => UserTypeChoicePage(),

                          builder: (context) => EstimationResults(),
                      ),
                    );
                  }
                },
                onStepTapped: (int index) {
                  setState(() {
                    _index = index;
                  });
                },
                steps: <Step>[
                  _buildStep(
                    title: 'Step 1 : General questions',
                    content:

                    GeneralQuestionsWidget(    onSelectValues: _handleBrandModelSelection, ),
                    stepIndex: 0,
                  ),
                  _buildStep(
                    title: 'Step 2 : Technical questions',
                    content: TechnicalQuestionsWidget( brand: brandValue,
                      model: modelValue,
                      version: versionValue,),
                    stepIndex: 1,
                  ),
                  _buildStep(
                    title: 'Step 3 :Addional questions',
                    content: AdditionalQuestionsWidget(),
                    stepIndex: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Step _buildStep({
    required String title,
    required Widget content,
    required int stepIndex,
  }) {
    return Step(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: _index == stepIndex ? Colors.white : Colors.white60,
        ),
      ),
      content:content,

      state: _index >= stepIndex ? StepState.complete : StepState.disabled,
      isActive: _index == stepIndex,
    );
  }
}
