import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifematch/Database/auth.dart';
import 'package:lifematch/constants.dart';
import 'package:lifematch/main.dart';
import 'package:lifematch/screens/mainpage.dart';

class Firstname extends StatefulWidget {
  const Firstname({super.key});

  @override
  State<Firstname> createState() => _FirstnameState();
}

class _FirstnameState extends State<Firstname> {
  final _formkey = GlobalKey<FormState>();
  String firstname = '';
  TextEditingController namecontroller = TextEditingController();
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map;

    String location = data['location'];
    String preference = data['interest'];
    List hobbies = data['listofhobbies'];
    String bio = data['bio'];
    String gender = data['gender'];
    String dateofbirth = data['dob'];
    String minimumage = data['minimumage'];
    String maximumage = data['maximumage'];
    File? img1 = data['img1'];
    File? img2 = data['img2'];
    File? img3 = data['img3'];
    File? img4 = data['img4'];
    File? img5 = data['img5'];
    File? img6 = data['img6'];


    return SafeArea(
      child: Scaffold(
        body: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.arrow_back_ios),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                  ),
                  Text(
                    'Step 5 of 5',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 70, left: 20),
                child: Text(
                  'What do you want to be called ?',
                  style: GoogleFonts.aBeeZee(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      firstname = value;
                    });
                  },
                  controller: namecontroller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Empty Field';
                    }
                  },
                  decoration: ktextformfield.copyWith(hintText: 'Enter Name'),
                ),
              ),
              newbutton(
                  text: Text('Complete'),
                  onpress: () async {
                    await Database(uid: currentuid).adduserinfo(
                      firstname: namecontroller.text,
                      bio: bio,
                      gender: gender,
                      country: location,
                      dateofbirth: dateofbirth.substring(1, 10),
                      preference: preference,
                      hobbies: hobbies,
                      uid: currentuid,
                      maximumage: maximumage,
                      minimumage: minimumage,
                      img1: img1,
                      img2: img2,
                      img3: img3,
                      img4: img4,
                      img5: img5,
                      img6: img6,
                    );
                    Navigator.pushReplacementNamed(context, Routes.home.name);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
