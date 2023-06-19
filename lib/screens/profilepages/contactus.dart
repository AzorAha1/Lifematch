import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Contactus extends StatefulWidget {
  const Contactus({super.key});

  @override
  State<Contactus> createState() => _ContactusState();
}

class _ContactusState extends State<Contactus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              InkWell(
                child: Icon(Icons.arrow_back_ios_new),
                onTap: () => Navigator.pop(context),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                'Settings',
                style: GoogleFonts.aBeeZee(
                    fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
