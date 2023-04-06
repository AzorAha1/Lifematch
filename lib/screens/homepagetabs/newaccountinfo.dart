import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lifematch/screens/Registration/picturesandbios.dart';

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
            }
            String image1 = snapshot.data?.get('image 1');
            String firstname = snapshot.data?.get('firstname');
            profilepic = File(image1);
            return Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                CircleAvatar(
                  radius: 70,
                  backgroundImage: FileImage(profilepic!),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  firstname,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 90,
                ),
                profileitems(
                  icon: Icons.edit_document,
                  title: 'Edit profile',
                ),
                SizedBox(
                  height: 50,
                  child: Divider(
                    indent: 5,
                    endIndent: 5,
                    thickness: 1,
                  ),
                ),
                profileitems(
                  icon: Icons.settings,
                  title: 'Settings',
                ),
                SizedBox(
                  
                  height: 50,
                  child: Divider(
                    indent: 5,
                    endIndent: 5,
                    thickness: 1,
                  ),
                ),
                profileitems(
                  icon: Icons.message,
                  title: 'Contact us',
                ),
                SizedBox(
                  height: 50,
                  child: Divider(
                    indent: 5,
                    endIndent: 5,
                    thickness: 1,
                  ),
                ),
                profileitems(
                  icon: Icons.notifications,
                  title: 'Notification',
                ),
                SizedBox(
                  height: 50,
                  child: Divider(
                    indent: 5,
                    endIndent: 5,
                    thickness: 1,
                  ),
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
  IconData icon;
  profileitems({this.title, required this.icon});

  @override
  State<profileitems> createState() => _profileitemsState();
}

class _profileitemsState extends State<profileitems> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('pressed');
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
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
