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
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 150, bottom: 20.0),
                  child: newbutton(
                    onpress: (() {}),
                    text: Text('Log in'),
                  ),
                ),
                SizedBox(
                  height: 50,
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
              Text('Not a member yet ? ',style: GoogleFonts.aBeeZee(),),
              InkWell(
                onTap: () => Navigator.pushNamed(context, '/signup'),
                child: Text(
                  'Register now',
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
