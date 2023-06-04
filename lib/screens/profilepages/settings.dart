import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifematch/screens/Registration/completed.dart';

class Settingpage extends StatefulWidget {
  const Settingpage({super.key});

  @override
  State<Settingpage> createState() => _SettingpageState();
}

class _SettingpageState extends State<Settingpage> {
  File? _profilepic;
  final user = FirebaseAuth.instance.currentUser?.email;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator(
            color: Colors.red,
          );
        }
        User? _user = snapshot.data;
        return StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(_user?.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator(
                color: Colors.red,
              );
            }
            String _firstname = snapshot.data?.get('firstname');
            String _firstpic = snapshot.data?.get('image 1');
            _profilepic = File(_firstpic);
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
                      Icon(Icons.arrow_back_ios),
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
                  Container(
                    
                    height: 100,
                    width: 400,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 1, 25, 46),
                        Color.fromARGB(255, 5, 65, 114),
                        Color.fromARGB(255, 12, 136, 238)
                      ]),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.red,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: FileImage(_profilepic!),
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(_firstname,style: TextStyle(color: Colors.white),),
                            Text(_user!.email.toString(),style: TextStyle(color: Colors.white),),
                            Text('ID:${_user.uid}',style: TextStyle(color: Colors.white),),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
