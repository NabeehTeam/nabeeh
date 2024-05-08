import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nabeeh/screens/classroomHomePage.dart';

import '../widget/navBarWidget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60), // Set your preferred AppBar height
        child: AppBar(
          // title: const Text("Nabeeh"),
          backgroundColor: const Color(0xFFA1CACC),
        ),
      ),
      body: Container(
        color: Color(0xFFA1CACC),
        height: height,
        width: width,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(),
              height: height * 0.15, // Adjust the height as needed
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 80),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // Aligns children along the main axis
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome, Dr.Nadia",
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Last Update ${DateFormat.yMMMMd().format(DateTime.now())}",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 70), // Added padding
                          child: Icon(
                            // Add the person icon
                            IconData(0xee35, fontFamily: 'MaterialIcons'),
                            color: Colors.black,
                            size: 60,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/image/nabeehLogo.webp',
                                height: 300,
                                width: 300,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  "The idea of our project (Analyze Student Engagement in e-Learning - Nabeeh),\n"
                                      " aims to use computer vision techniques to track students' facial expressions,\n"
                                      " eye movements, and head pose during online lectures. By analyzing these indicators,\n"
                                      " the project aims to provide insights into student engagement and stress levels,\n"
                                      " improve the learning experience, and enhance the efficiency of online education.",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black87,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: CustomDrawer(),
    );
  }
}
