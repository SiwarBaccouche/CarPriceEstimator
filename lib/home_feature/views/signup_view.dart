import 'dart:io';

import 'package:flutter/material.dart';
import '../../../core/utils/values/colors.dart';
import '../../../core/utils/common_functions.dart';
import '../../core/utils/values/styles.dart';
import '../widgets/details_widgets/customTextField.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController phoneNumberController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    super.initState();
    // Initialize text controllers
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneNumberController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    // Dispose text controllers when the widget is disposed
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> signUp() async {
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    String phoneNumber = phoneNumberController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;
    final String apiUrl = 'http://192.168.1.6:8080/api/auth/signup';


    // Request body with user data
    final Map<String, dynamic> requestData = {
    "username": firstName,
    "email": email,
    "role": [ "ROLE_USER" ],
    "password": password,
      /*'username': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,*/
      // Add other fields if required by your backend
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(requestData),
      );

      if (response.statusCode == 200) {
        // Successful signup, handle the response if needed
        print('Signed up successfully!');
      } else {
        // Handle errors or unsuccessful signup
        String responseBody = response.body; // Get the response body
        print('Signup failed: $responseBody');
      }
    } catch (e) {
      // Handle exceptions or network errors
      print('Error during signup: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;
    final OutlineInputBorder customBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide(color: secondaryColor),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.1),
                ),
                Text(
                  "PRIXVOITURE",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                CustomTextField(
                  controller: firstNameController,
                  hintText: "First name",
                  prefixIcon: Icons.person,
                ),
                CustomTextField(
                  controller: lastNameController,
                  hintText: "Last name",
                  prefixIcon: Icons.person_2,
                  isObscureText: false,
                ),
                CustomTextField(
                  controller: phoneNumberController,
                  hintText: "Phone number",
                  prefixIcon: Icons.phone,
                ),
                CustomTextField(
                  controller: emailController,
                  hintText: "Email",
                  prefixIcon: Icons.email,
                ),
                CustomTextField(
                  controller: passwordController,
                  hintText: "Password",
                  prefixIcon: Icons.lock,
                  isObscureText: true,
                ),
                CustomTextField(
                  controller: confirmPasswordController,
                  hintText: "Confirm password",
                  prefixIcon: Icons.lock,
                  isObscureText: true,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: signUp,
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
                      "Sign up",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "You don't have an account?",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, '/login'); // Replace with your route name
                  },
                  child: Text(
                    "Log in",
                    style: TextStyle(
                      color: secondaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}