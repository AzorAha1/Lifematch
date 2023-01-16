import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifematch/constants.dart';
import 'package:lifematch/screens/mainpage.dart';
import 'package:lifematch/Database/auth.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  String email = '';
  String password = '';
  String error = '';
  final signinanon = Database();

  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();

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
                    controller: email_controller,
                    onChanged: (value) => email = value,
                    decoration: ktextformfield.copyWith(
                        hintText: 'Username or Email',
                        hintStyle: GoogleFonts.aBeeZee()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: password_controller,
                    obscureText: true,
                    onChanged: (value) => password = value,
                    decoration: ktextformfield.copyWith(
                        hintText: 'Password', hintStyle: GoogleFonts.aBeeZee()),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 150, bottom: 20.0),
                  child: newbutton(
                    onpress: () async {
                      print(email);
                      print(password);
                      email_controller.clear();
                      password_controller.clear();
                      dynamic result =
                          await signinanon.signinWithEmailandPassword(
                              email: email, password: password);
                      if (result != null) {
                        setState(() {
                          Navigator.pushNamed(context, '/home');
                          print('logged in');
                        });
                      } else {
                        setState(() {
                          error =
                              'Invalid Login Credentials\n             Try Again!';
                        });
                      }
                    },
                    text: Text('Log in'),
                  ),
                ),

                SizedBox(
                  height: 40,
                ),
                // InkWell(
                //   child: Text(
                //     'Click to Sign up here',
                //     style: GoogleFonts.aBeeZee(color: Colors.red),
                //   ),
                //   onTap: () {
                //     Navigator.pushNamed(context, '/signup');
                //   },
                // ),

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
                      onpress: () async {
                        dynamic result = await signinanon.signinAnon();

                        if (result != null) {
                          Navigator.pushNamed(context, '/home');
                        }
                      },
                    ),
                  ],
                ),
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
                'Not a member yet ? ',
                style: GoogleFonts.aBeeZee(),
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(context, '/signup'),
                child: Text(
                  'Register now',
                  style: GoogleFonts.aBeeZee(color: Colors.red),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 80,
          ),
          Text(
            error,
            style: GoogleFonts.aBeeZee(color: Colors.orange),
          )
        ],
      ),
    );
  }
}

class imagecontain extends StatefulWidget {
  String? imagepath;
  Function()? onpress;
  imagecontain({required this.imagepath, required this.onpress});

  @override
  State<imagecontain> createState() => _imagecontainState();
}

class _imagecontainState extends State<imagecontain> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onpress,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          border:
              Border.all(color: Color.fromARGB(255, 120, 113, 113), width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.asset(widget.imagepath!),
        height: 50,
      ),
    );
  }
}
