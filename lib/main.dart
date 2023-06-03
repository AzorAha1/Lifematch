import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lifematch/screens/Registration/completed.dart';
import 'package:lifematch/screens/Registration/interests.dart';
import 'package:lifematch/screens/Registration/picturesandbios.dart';
import 'package:lifematch/screens/Registration/preference.dart';
import 'package:lifematch/screens/Signin.dart';
import 'package:lifematch/screens/Registration/Signup.dart';
import 'package:lifematch/screens/forgotpassword.dart';
import 'package:lifematch/screens/home.dart';

import 'package:lifematch/screens/mainpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum Routes {
  main,
  signin,
  signup,
  home,
  forgetpassword,
  picturesandbios,
  preferences,
  interests,
  completed,
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(
    
  ));
}

class MyApp extends StatefulWidget {
  
  
 
  

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
    

  bool mode = true;
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
 
      initialRoute: Routes.main.name,
      theme: mode ? ThemeData.light() : ThemeData.dark(),
      routes: {
        Routes.main.name: (context) => Mainpage(),
        Routes.signin.name: (context) => Signin(),
        Routes.signup.name: (context) => Signup(),
        Routes.home.name: (context) => Homepage(),
        Routes.forgetpassword.name: (context) => Forgotpassword(),
        Routes.picturesandbios.name: (context) => Picturesandbios(),
        Routes.preferences.name: (context) => Preferences(),
        Routes.interests.name: (context) => Interests(),
        Routes.completed.name: (context) => Firstname(),
      },
    );
  }
}
