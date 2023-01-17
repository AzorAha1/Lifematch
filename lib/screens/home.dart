import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // InkWell(
                //   child: Icon(Icons.arrow_back_ios),
                // ),
                SizedBox(
                  width: 130,
                ),
                Text(
                  'LifeMatch',
                  style: GoogleFonts.aBeeZee(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Image.asset(
                  'images/background.png',
                  width: 30,
                ),
                SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () => print(user.emailVerified),
                  child: CircleAvatar(
                    backgroundColor: Colors.black26,
                    child: Text(
                      user.email!.substring(0, 1).toUpperCase(),
                      style: GoogleFonts.aBeeZee(color: Colors.teal),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                InkWell(
                  onTap: () async {
                    await _auth.signOut();
                    Navigator.pushReplacementNamed(context, '/signin');
                  },
                  child: Icon(
                    Icons.logout_outlined,
                    color: Colors.black26,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Text(user.email!),
          )
        ],
      ),
    );
  }
}
