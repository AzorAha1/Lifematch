import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lifematch/main.dart';
import 'package:lifematch/screens/Registration/picturesandbios.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:restart_app/restart_app.dart';

class NewAccountinfo extends StatefulWidget {
  const NewAccountinfo({super.key});

  @override
  State<NewAccountinfo> createState() => _NewAccountinfoState();
}

class _NewAccountinfoState extends State<NewAccountinfo> {
  File? profilepic;

  File? nullimage;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return StreamBuilder<User?>(
      initialData: null,
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        User? _user = snapshot.data;
        return StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(_user?.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            String image1 = snapshot.data?.get('image 1');
            String firstname = snapshot.data?.get('firstname');
            String bio = snapshot.data?.get('bio');
            profilepic = File(image1);
            return Column(
              children: [
                SizedBox(
                  height: screenheight * 0.05,
                ),
                CircleAvatar(
                  radius: screenWidth * 0.15,
                  backgroundImage: FileImage(profilepic!),
                ),
                SizedBox(
                  height: screenheight * 0.02,
                ),
                Text(
                  firstname,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: screenheight * 0.05,
                ),
                Text(bio),
                SizedBox(
                  height: screenheight * 0.08,
                ),
                profileitems(
                  icon: Icons.edit_document,
                  title: 'Profile',
                ),
                SizedBox(
                  height: screenheight * 0.07,
                  child: Divider(
                    indent: screenWidth * 0.02,
                    endIndent: screenWidth * 0.02,
                    thickness: screenWidth * 0.003,
                  ),
                ),
                profileitems(
                  icon: Icons.settings,
                  title: 'Settings',
                  ontap: () {
                    Navigator.pushNamed(context, Routes.settings.name);
                  },
                ),
                SizedBox(
                  height: screenheight * 0.07,
                  child: Divider(
                    indent: screenWidth * 0.02,
                    endIndent: screenWidth * 0.02,
                    thickness: screenWidth * 0.003,
                  ),
                ),
                profileitems(
                  ontap: () => Navigator.pushNamed(context, Routes.contactus.name),
                  icon: Icons.message,
                  title: 'Contact us',
                ),
                SizedBox(
                  height: screenheight * 0.07,
                  child: Divider(
                    indent: screenWidth * 0.02,
                    endIndent: screenWidth * 0.02,
                    thickness: screenWidth * 0.003,
                  ),
                ),
                profileitems(
                  icon: Icons.notifications,
                  title: 'Notification',
                  ontap: () => Navigator.pushNamed(context, Routes.notifications.name),
                ),
                SizedBox(
                  height: screenheight * 0.07,
                  child: Divider(
                    indent: screenWidth * 0.02,
                    endIndent: screenWidth * 0.02,
                    thickness: screenWidth * 0.002,
                  ),
                ),
                MaterialButton(
                  child: Text(
                    'Log out',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22)),
                  color: Colors.red,
                  minWidth: screenWidth * 0.8,
                  height: screenheight * 0.06,
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushReplacementNamed(context, Routes.signin.name);
                    //MyApp.restartthis(context);
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class profileitems extends StatefulWidget {
  String? title;

  IconData? icon;
  Function()? ontap;
  profileitems({this.title, this.icon, this.ontap});

  @override
  State<profileitems> createState() => _profileitemsState();
}

class _profileitemsState extends State<profileitems> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: widget.ontap,
      child: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.03, right: screenWidth * 0.02),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${widget.title}',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            InkWell(
              child: Icon(
                widget.icon,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
