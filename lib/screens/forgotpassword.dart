import 'package:flutter/material.dart';
import 'package:lifematch/constants.dart';
import 'package:lifematch/screens/mainpage.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: ktextformfield,
          ),
          newbutton(
            text: Text('Reset Password'),
            onpress: (){

          }),
        ],
      ),
    );
  }
}
