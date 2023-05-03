import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifematch/constants.dart';
import 'package:lifematch/main.dart';
import 'package:lifematch/screens/mainpage.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  TextEditingController emailcontroller = TextEditingController();

  final _auth = FirebaseAuth.instance;

  Future resetpassword() async {
    try {
      await _auth.sendPasswordResetEmail(email: emailcontroller.text);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('Password has been reset\nCheck Email to confirm'),
            );
          });
      
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Screenwidth = MediaQuery.of(context).size.width;
    final Screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50,left: 20),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    child: Icon(Icons.arrow_back_ios),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, Routes.signin.name);
                    },
                  ),
                   SizedBox(
                    width: 80,
                  ),
                Text(
                  'Reset Password',
                  style: GoogleFonts.aBeeZee(fontSize: 30),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 30, right: 30),
            child: TextFormField(
              controller: emailcontroller,
              decoration: ktextformfield.copyWith(
                  hintText: 'Enter Email', hintStyle: GoogleFonts.aBeeZee()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 135.0, top: 20),
            child: newbutton(
              onpress: resetpassword,
              text: Text('Reset'),
            ),
          )
        ],
      ),
    );
  }
}
