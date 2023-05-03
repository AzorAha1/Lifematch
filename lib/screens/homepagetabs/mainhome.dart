import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifematch/main.dart';
import 'package:lifematch/screens/mainpage.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class mainhome extends StatefulWidget {
  const mainhome({super.key});

  @override
  State<mainhome> createState() => _mainhomeState();
}

class _mainhomeState extends State<mainhome> {
  bool Loading = false;
  final _auth = FirebaseAuth.instance;

  User? user;
  void initState() {
    // TODO: implement initState
    _auth.authStateChanges().listen((User? currentuser) {
      if (currentuser != null) {
        setState(() {
          user = currentuser;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Screenwidth = MediaQuery.of(context).size.width;
    final Screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: Loading,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: Screenheight * 0.02, left: Screenwidth * 0.04),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    child: Icon(Icons.arrow_back_ios),
                  ),
                  SizedBox(
                    width: Screenwidth * 0.2,
                  ),
                  Text(
                    'LifeMatch',
                    style: GoogleFonts.aBeeZee(
                        fontSize: Screenheight * 0.03, fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    'images/background.png',
                    width: Screenwidth * 0.08,
                  ),
                  SizedBox(
                    width: Screenwidth * 0.08,
                  ),
                  GestureDetector(
                    onTap: () => print(user?.emailVerified),
                    child: CircleAvatar(
                      backgroundColor: Colors.black26,
                      child: Text(
                        user?.email?.substring(0, 1).toUpperCase() ?? 'null',
                        style: GoogleFonts.aBeeZee(color: Colors.teal),
                      ),
                    ),
                  ),
                  SizedBox(width: Screenwidth * 0.05),
                  InkWell(
                    onTap: () async {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                  'Are you sure you want to Sign out of Account ?'),
                              actions: [
                                newbutton(
                                  onpress: () async {
                                    setState(() {
                                      Loading = true;
                                    });
                                    await _auth.signOut();

                                    Navigator.pushReplacementNamed(
                                        context, Routes.signin.name);
                                    setState(() {
                                      Loading = false;
                                    });
                                  },
                                  text: Text('Yes'),
                                ),
                                newbutton(
                                  onpress: () {
                                    Navigator.pop(context);
                                  },
                                  text: Text('No'),
                                )
                              ],
                            );
                          });
                    },
                    child: Icon(
                      Icons.logout_outlined,
                      color: Colors.black26,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: Screenheight * 0.025),
              child: Center(
                child: Text(user?.email ?? 'not signed in'),
              ),
            ),
            SizedBox(
              height: Screenheight * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
