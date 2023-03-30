import 'package:firebase_auth/firebase_auth.dart';
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
    return Scaffold(
      body: ModalProgressHUD(
          inAsyncCall: Loading,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      child: Icon(Icons.arrow_back_ios),
                    ),
                    SizedBox(
                      width: 90,
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
                      onTap: () => print(user?.emailVerified),
                      child: CircleAvatar(
                        backgroundColor: Colors.black26,
                        child: Text(
                          user?.email?.substring(0, 1).toUpperCase() ?? 'null',
                          style: GoogleFonts.aBeeZee(color: Colors.teal),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
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
                padding: const EdgeInsets.only(right: 20),
                child: Center(
                  child: Text(user?.email ?? 'not signed in'),
                ),
              )
            ],
          ),
        ),
    );
  }
}