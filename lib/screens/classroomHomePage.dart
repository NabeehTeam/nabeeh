import 'package:flutter/material.dart';

import 'classroom.dart';
import 'package:nabeeh/widget/navBarWidget.dart';

class classroomHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nabeeh"),
        backgroundColor: const Color(0xFFA1CACC),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Scrollbar(
          // isAlwaysShown: true,
          thickness: 20,
          thumbVisibility: true,
          // controller: controller,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("All Courses:", style: TextStyle(color: Colors.black, fontSize: 25 , fontWeight: FontWeight.bold)),
                SizedBox(height: 20),// Text widget instead of Title
                _classroomRow(context, [
                  _classroomCard(context, "Introduction to SWE", "assets/image/software.png","SECTION: SB7", Color(0xFFE6DDF2)),
                  _classroomCard(context, "JAVA", "assets/image/java.png", "SECTION: S7", Color(0xFF56859B)),
                  _classroomCard(context, "Web Development", "assets/image/web.jpeg", "SECTION: E37", Color(0xFFC7E3D9)),

                ]),
                SizedBox(height: 40),

                _classroomRow(context, [
                  _classroomCard(context, "Introduction to SWE", "assets/image/software.png", "SECTION: A12", Color(0xFFA1CCA1)),
                  _classroomCard(context, "JAVA", "assets/image/java.png", "SECTION: T23",  Color(0xFFA0CEE1)),
                  _classroomCard(context,  "Web Development", "assets/image/web.jpeg", "SECTION: EM21",  Color(0xFFBBC5CB)),
                ]),
              ],
            ),
          ),
        ),
      ),
      drawer: const CustomDrawer(),
    );
  }

  Widget _classroomRow(BuildContext context, List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: children,
      ),
    );
  }

  Widget _classroomCard(BuildContext context, String title, String imagePath, String c,Color color) {
    return Container(
      width: 300,
      height: 410,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(height: 35),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          Image.asset(
            imagePath,
            width: 250,
            height: 100,
          ),
          Text(
            c,
            style: const TextStyle(

              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Column(
            children: <Widget>[
              SizedBox(
                height: 40,
                width: 220,
                child: _classroomButton(context, "Create online Classroom"),
              ),
              const SizedBox(height: 15), // Reduced space between buttons
              SizedBox(
                height: 40,
                width: 220, // Set the height of the buttons
                child: _classroomButton(context, "More Info"),
              ),
            ],
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _classroomButton(BuildContext context, String text) {
    return MaterialButton(
      minWidth: 100,
      height: 40,
      onPressed: () {
        // Navigate to respective pages
        if (text == "Create online Classroom") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OnlineClassroom(), // Use the class name directly
            ),
          );
        } else if (text == "More Info") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MoreInfoPage()),
          );
        }
      },
      color: Colors.white,
      textColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }
}

class MoreInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("More Info"),
      ),
      body: const Center(
        child: Text("More Info Page"),
      ),
    );
  }
}

