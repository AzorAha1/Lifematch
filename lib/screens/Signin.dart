import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifematch/constants.dart';
import 'package:lifematch/screens/mainpage.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  child: Icon(Icons.arrow_back_ios),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  width: 130,
                ),
                Text(
                  'Sign In',
                  style: GoogleFonts.aBeeZee(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
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
                    text: Text('Log in'),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  child: Text(
                    'Click to Sign up here',
                    style: GoogleFonts.aBeeZee(color: Colors.red),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
