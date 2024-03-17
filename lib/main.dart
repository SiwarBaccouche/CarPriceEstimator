import 'package:flutter/material.dart';
import 'package:prixvoiture/core/utils/values/colors.dart';
import 'package:prixvoiture/home_feature/admin_views/manage_cars_view.dart';
import 'package:prixvoiture/home_feature/views/admin_root_view.dart';
import 'package:prixvoiture/home_feature/views/detailedQuiz_View.dart';
import 'package:prixvoiture/home_feature/views/estimation_result_view.dart';
import 'package:prixvoiture/home_feature/views/login_view.dart';

import 'home_feature/admin_views/manage_brands_view.dart';
import 'home_feature/views/landing_page_view.dart';
import 'home_feature/views/quiz_choice_view.dart';
import 'home_feature/views/signup_view.dart';
import 'home_feature/views/simple_quiz_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PRIXVOITURE',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        useMaterial3: true,

      ),
      home: LandingPage(),
     //home: AdminRootView(),
//home: QuizChoicePage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/quiz_choice': (context) => QuizChoicePage(),
        '/SimpleQuiz': (context) => SimpleQuiz(),
        '/DetailedQuiz': (context) =>DetailedQuiz(),
        '/estimationResult': (context) => EstimationResults(),
        '/modelsManagement': (context) => ManageModels(),
        '/brandsManagement': (context) => ManageBrands(),
        '/admin_root_view': (context)=>AdminRootView(),
      },
    );
  }
}
