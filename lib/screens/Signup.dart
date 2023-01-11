import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import 'Signin.dart';
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
            child: Row(
              children: [
                InkWell(
                    child: Icon(Icons.arrow_back_ios),
                    onTap: () {
                      Navigator.pop(context);
                    }),
                SizedBox(
                  width: 130,
                ),
                Text(
                  'Sign Up',
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
                    text: Text('Register'),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        indent: 20,
                        endIndent: 20,
                        thickness: 1,
                      ),
                    ),
                    Text(
                      'Or Continue with',
                      style: GoogleFonts.aBeeZee(
                          color: Color.fromARGB(221, 193, 181, 181)),
                    ),
                    Expanded(
                      child: Divider(
                        indent: 20,
                        endIndent: 20,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    imagecontain(
                      imagepath: 'images/googleimage.png',
                      onpress: () {},
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    imagecontain(
                      imagepath: 'images/anonymous.png',
                      onpress: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account? ',
                style: GoogleFonts.aBeeZee(),
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(context, '/signin'),
                child: Text(
                  'Log in ',
                  style: GoogleFonts.aBeeZee(color: Colors.red),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
