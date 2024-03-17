import 'package:flutter/material.dart';
import 'package:prixvoiture/core/utils/values/colors.dart';
import 'package:prixvoiture/home_feature/views/estimation_result_view.dart';
import '../widgets/questions_widgets/simple_additional_questions_widget.dart';
import '../widgets/questions_widgets/simple_general_questions_widget.dart';
import '../widgets/questions_widgets/simple_technical_questions_widget.dart';

class SimpleQuiz extends StatefulWidget {
  const SimpleQuiz({Key? key}) : super(key: key);

  @override
  _SimpleQuizState createState() => _SimpleQuizState();
}

class _SimpleQuizState extends State<SimpleQuiz> {
  int _index = 0;
  String? brandValue;
  String? modelValue;
  void _handleBrandModelSelection(String? brand, String? model) {
    setState(() {
      brandValue = brand;
      modelValue = model;

      print('Selected brand: $brand');
      print('Selected model: $model');

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

                    SimpleGeneralQuestionsWidget( onSelectValues: _handleBrandModelSelection, ),
                    stepIndex: 0,
                  ),
                  _buildStep(
                    title: 'Step 2 : Technical questions',
                    content: SimpleTechnicalQuestionsWidget(brand: brandValue,
                      model: modelValue,),
                    stepIndex: 1,
                  ),
                  _buildStep(
                    title: 'Step 3 :Addional questions',
                    content: SimpleAdditionalQuestionsWidget(),
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
