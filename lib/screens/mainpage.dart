import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(160, 100, 0, 0),
            child: Image.asset(
              'images/background.png',
              scale: 5,
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
            height: 450,
          ),
          MaterialButton(
            onPressed: () {},
            child: Text('Sign in'),
          ),
        ],
      ),
    );
  }
}
