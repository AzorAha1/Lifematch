import 'package:flutter/material.dart';
import 'package:lifematch/screens/Signin.dart';
import 'package:lifematch/screens/Signup.dart';
import 'package:lifematch/screens/mainpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool mode = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      theme: mode ? ThemeData.light() : ThemeData.dark(),
      routes: {
        '/': (context) => Mainpage(),
        '/signin': (context) => Signin(),
        '/signup': (context) => Signup(),
      },
    );
  }
}
