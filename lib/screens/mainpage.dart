import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:switcher/core/switcher_size.dart';
import 'package:switcher/switcher.dart';

class Mainpage extends StatefulWidget {
  
  bool mode = true;
  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
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
                    Navigator.pushNamed(context, '/signin');
                  },
                ),
                newbutton(
                  text: Text('Sign Up'),
                  onpress: () {
                    Navigator.pushNamed(context, '/signup');
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
  Text? text;
  Function()? onpress;

  newbutton({this.text, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 160),
      child: MaterialButton(
        color: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        onPressed: onpress,
        child: text,
      ),
    );
  }
}
