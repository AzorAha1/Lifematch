import 'package:flutter/material.dart';
import 'package:lifematch/screens/Signin.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Mainpage(),
      initialRoute: '/',
      routes: {
        '/':(context) => Mainpage(),
        '/signin':(context) => Signin(),
      },
    );
  }
}