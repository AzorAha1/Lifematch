import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifematch/main.dart';
import 'package:switcher/core/switcher_size.dart';
import 'package:switcher/switcher.dart';

class Mainpage extends StatefulWidget {
  bool mode = true;
  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: widget.mode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Expanded(
            flex: 1,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 150),
                  child: Switcher(
                    value: false,
                    size: SwitcherSize.large,
                    switcherButtonRadius: 50,
                    enabledSwitcherButtonRotate: true,
                    iconOff: Icons.light_mode,
                    iconOn: Icons.dark_mode,
                    colorOff: Colors.redAccent.withOpacity(0.3),
                    colorOn: Colors.red,
                    onChanged: (bool state) {
                      widget.mode = state;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(160, 100, 0, 0),
                  child: Expanded(
                    child: Image.asset(
                      'images/background.png',
                      scale: 5,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(160, 5, 0, 0),
                  child: Text(
                    'LifeMatch',
                    style: GoogleFonts.aBeeZee(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 400,
                ),
                newbutton(
                  text: Text('Sign In'),
                  onpress: () {
                    Navigator.pushNamed(context, Routes.signin.name);
                  },
                ),
                newbutton(
                  text: Text('Sign Up'),
                  onpress: () {
                    Navigator.pushNamed(context, Routes.signup.name);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class newbutton extends StatelessWidget {
  Widget? text;
  Function()? onpress;
  double? height;
  double? width;

  newbutton({required this.text, required this.onpress, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 160),
      child: MaterialButton(
        height: height,
        minWidth: width,
        color: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        onPressed: onpress,
        child: text,
      ),
    );
  }
}
