import 'package:flutter/material.dart';
import 'package:prixvoiture/core/utils/values/styles.dart';

import '../../core/utils/values/colors.dart';
import '../widgets/stats_widgets/quiz_stats_widget.dart';
import '../widgets/stats_widgets/satistfaction_chart.dart';
import '../widgets/stats_widgets/user_stats_widget.dart';

class AdminRootView extends StatelessWidget {
  const AdminRootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AdminsecondaryColor,

          // Add a hamburger menu icon
        ),
        drawer: Drawer(
          width: size.width * 0.7,
          shadowColor: Colors.blueGrey,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: AdminsecondaryColor,
                ),
                child: Text(
                  'Hi, Admin',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
              ),
              ListTile(
                title: Text('Dashboard'),
                onTap: () {
                  Navigator.pushNamed(context, '/Dashboard');                },
              ),
              Divider(),
              ExpansionTile(
                backgroundColor: AdminsecondaryColor.withOpacity(0.5),
                title: Text('Manage'),
                children: [
                  ListTile(
                    title: Text('Users'),
                    onTap: () {
                      // Handle "Users" item selection
                      // You can navigate to a different page or perform an action here
                    },
                  ),
                  ExpansionTile(title: Text("Cars"),
                      children: [
                        ListTile(
                          title: Text('Brands'),
                          onTap: () {
                            Navigator.pushNamed(context, '/brandsManagement');
                          },),
                        ListTile(
                          title: Text('Models'),
                          onTap: () {
                            Navigator.pushNamed(context, '/modelsManagement');
                          },),

                      ]
                  ),
                ],
              ),
              ListTile(
                title: Text('Settings'),
                onTap: () {
                  // Handle "Cars" item selection
                },
              ),
              ListTile(
                title: Text('Logout'),
                onTap: () {
                  // Handle "Cars" item selection
                },
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Good morning, Admin",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Container(
                height: 2, // Height of the separator (adjust as needed)
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.purple.shade700,
                      Colors.white
                    ],
                    begin: Alignment.centerLeft,
                    // Start the gradient from the left
                    end: Alignment.centerRight, // End the gradient on the right
                  ),
                ),
              ),
              Text(
                "Types of quiz taken",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              QuizStats(),
              Divider(),
              Text(
                "Users's purpose of the quiz",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              UserStats(),
              Divider(),
              Text(
                "Satisfaction statistics",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              SatisfactionChart(),
            ]),
          ),
        ),
      ),
    );
  }
}
