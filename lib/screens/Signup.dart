import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import 'mainpage.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20),
            child: Text(
              'Sign Up',
              style: GoogleFonts.aBeeZee(
                  fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Form(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    decoration: ktextformfield.copyWith(
                        hintText: 'Username or Email',
                        hintStyle: GoogleFonts.aBeeZee()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    decoration: ktextformfield.copyWith(
                        hintText: 'Password', hintStyle: GoogleFonts.aBeeZee()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 150),
                  child: newbutton(
                    onpress: (() {}),
                    text: Text('Register'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
