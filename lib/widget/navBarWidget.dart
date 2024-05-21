import 'package:flutter/material.dart';
import 'package:nabeeh/screens/classroomHomePage.dart';
import 'package:nabeeh/screens/homePage.dart';
import 'package:nabeeh/screens/login.dart';

import 'main.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
       // color:Color(0xFFEDE3D0),
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
               color: Color(0xFFCED7DA)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 20),
                    child: Image(
                      image: AssetImage('assets/image/nabeehLogo-trans.webp'),
                      height: 125,
                      width: 300,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(15),
                children: [
                  _drawerItem(Icons.home, 'Home Page', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  }),
                  Divider(
                    color: Colors.black26,
                    thickness: 1,
                  ),
                  _drawerItem(Icons.class_, 'Classroom', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => classroomHomePage()),
                    );
                  }),
                  Divider(
                    color: Colors.black26,
                    thickness: 1,
                  ),
                  _drawerItem(Icons.dashboard, 'Dashboard', () {
                    // Navigate to Dashboard Page
                  }),
                ],
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 1,
            ),
            _drawerItem(Icons.person, 'My Profile', () {
              // Navigate to Profile Page
            }),
            _drawerItem(Icons.settings, 'Settings', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>  login()),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title, void Function() onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}