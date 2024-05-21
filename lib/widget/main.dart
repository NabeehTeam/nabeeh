import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nabeeh/screens/homePage.dart';
import 'package:nabeeh/screens/login.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Nabeeh",
      home: StreamBuilder(
        stream: FirebaseAuth.instance.userChanges(),
        builder:(context, snapshot){
          if(snapshot.hasData){
            return HomePage();
         } else {
           return login();
         }
      },
    )
    );
  }
}

