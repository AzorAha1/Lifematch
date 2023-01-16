import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lifematch/screens/Signin.dart';
import 'package:lifematch/screens/Signup.dart';
import 'package:lifematch/screens/home.dart';
import 'package:lifematch/screens/mainpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool mode = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      theme: mode ? ThemeData.light() : ThemeData.dark(),
      routes: {
        '/': (context) => Mainpage(),
        '/signin': (context) => Signin(),
        '/signup': (context) => Signup(),
        '/home':(context) => Homepage(),
      },
    );
  }
}
