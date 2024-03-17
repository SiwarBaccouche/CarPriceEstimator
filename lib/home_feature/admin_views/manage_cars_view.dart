import 'package:flutter/material.dart';
import 'package:prixvoiture/core/utils/values/colors.dart';

import '../widgets/adminWidgets/carsListItem.dart';

// Import other necessary dependencies and classes

class ManageModels extends StatelessWidget {
  const ManageModels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Corrected method signature
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Car list:",
                    style: TextStyle(color: Colors.black),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Implement the onPressed functionality
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AdminsecondaryColor.withOpacity(0.7),
                      // Replace with
                      fixedSize: Size(size.width * 0.2, size.height * 0.07),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      elevation: 5,
                      shadowColor: Colors.black,
                    ),
                    child: Container(
                    //  color: AdminsecondaryColor.withOpacity(0.7),
                      alignment: Alignment.center,
                      child: Text(
                        "Add",
                        style: TextStyle(
                          color: AdminPimaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: size.height * 0.8,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Scrollbar(
                        child: SingleChildScrollView(
                          child: Column(
                            // Implement the list of cars or widgets here
                            children: [
                              Container(
                                  width: size.width * 0.9, child: CarCard()),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Container(
                                  width: size.width * 0.9, child: CarCard()),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Container(
                                  width: size.width * 0.9, child: CarCard()),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Container(
                                  width: size.width * 0.9, child: CarCard()),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              // Add widgets for displaying cars or other content
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
