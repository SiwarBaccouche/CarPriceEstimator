import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import '../../../core/utils/values/colors.dart';
import '../../../core/utils/common_functions.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future save() async {
      String username = emailController.text;
      String password = passwordController.text;
      String url = "http://192.168.1.8:8080/api/auth/signin";
      try {
        final response = await http.post(
          Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: json.encode({"username": username, "password": password}),
        );

        if (response.statusCode == 200) {
          // Successful login, handle response or token here
          Map<String, dynamic> responseBody = json.decode(response.body);
          String userRole = responseBody[
              'role']; // Assuming the role is returned in the response

          // Redirect based on user role
          if (userRole == 'ROLE_ADMIN') {
            Navigator.pushReplacementNamed(context, '/admin_root_view');
          } else if (userRole == 'ROLE_USER') {
            Navigator.pushReplacementNamed(context, '/quiz_choice');
          } else {
            // Handle unknown or unsupported roles
            // Redirect to a default screen or show an error message
          }
        } else {
          // Handle error response
          print("Failed to log in: ${response.statusCode}");
          // Display an error message or handle the error accordingly
        }
      } catch (error) {
        // Handle other potential errors (e.g., network issues)
        print("Error occurred: $error");
        // Display an error message or handle the error accordingly
      }
    }

    @override
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;
    final OutlineInputBorder customBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide(color: secondaryColor),
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
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
                Image.asset(
                  'assets/landing_pic.jpg',
                  width: size.width,
                  height: size.height * 0.3,
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: size.width * 0.8,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        controller: emailController,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textInputAction: TextInputAction.next,
                        // Set keyboard action
                        onFieldSubmitted: (_) {
                          // Move focus to the next field when "Next" is tapped
                          FocusScope.of(context).nextFocus();
                        },
                        decoration: InputDecoration(
                          hintText: "Email",
                          enabledBorder: customBorder,
                          focusedBorder: customBorder,
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: size.width * 0.8,
                      child: TextFormField(
                        textInputAction: TextInputAction.done,
                        // Set keyboard action
                        onFieldSubmitted: (_) {
                          // Move focus to the next field when "Next" is tapped
                          FocusScope.of(context).nextFocus();
                        },
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        style: TextStyle(
                          color: Colors.white, // Set the text color to white
                        ),
                        obscureText: true,
                        // Hide password
                        decoration: InputDecoration(
                          hintText: "Password",
                          enabledBorder: customBorder,
                          // Border when not focused
                          focusedBorder: customBorder,
                          // Border when focused
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Reset password",
                      style: TextStyle(
                        color: secondaryColor
                            .withOpacity(0.8), // Set the text color to white
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: ()
                      /*async {
                  save();}*/
                      {
                    Navigator.pushNamed(context, '/quiz_choice');
                  },
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
                      "Log in",
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
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      color: secondaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/admin_root_view');
                  },
                  child: Text(
                    "Admin App",
                    style: TextStyle(
                      color: secondaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
