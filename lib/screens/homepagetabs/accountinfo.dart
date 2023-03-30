import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lifematch/Database/auth.dart';
import 'package:line_icons/line_icon.dart';

class Accountinfo extends StatefulWidget {
  const Accountinfo({super.key});

  @override
  State<Accountinfo> createState() => _AccountinfoState();
}

class _AccountinfoState extends State<Accountinfo> {
  FirebaseAuth userdata = FirebaseAuth.instance;
  final currentuser = FirebaseAuth.instance.currentUser?.uid;

  final double tophalfheight = 200;
  double imagecontainerheight = 100;
  double imagecontainerwidth = 140;
  String likes = '0';
  String matches = '0';
  String dates = '0';
  String b = 'Loading...';
  String firstname = '';

  File nullimage = File('images/account.png');
  File? profilepic;
  List<dynamic> hobbies = [];

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.currentUser;
    return StreamBuilder<User?>(
        initialData: null,
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          User? user = snapshot.data;
          return StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(user?.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                b = snapshot.data!.get('bio') ?? 'No bio yet';
                hobbies = snapshot.data!.get('hobbies');
                String? newimage =
                    snapshot.data!.get('image 1') ?? 'Not available';
                firstname = snapshot.data!.get('firstname');
                profilepic = File(newimage!);
                return Scaffold(
                  backgroundColor: Color(0xffF4F3DA),
                  body: Column(
                    children: [
                      Stack(clipBehavior: Clip.none, children: [
                        tophalf(),
                        Positioned(
                          top: 150,
                          width: 400,
                          child: profilepicture(),
                        ),
                      ]),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        '$firstname',
                        style: GoogleFonts.aBeeZee(fontSize: 20),
                      ),
                      Text(
                        '@${userdata.currentUser?.email}',
                        style: GoogleFonts.aBeeZee(fontSize: 12),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        b,
                        style: GoogleFonts.aBeeZee(fontSize: 15),
                      ),
                      Row(
                        children: [
                          newcontainer(
                            text: Text(
                              likes,
                              style: TextStyle(fontSize: 35),
                            ),
                            subtitle: Text(
                              'Likes You',
                              style:
                                  GoogleFonts.aBeeZee(color: Color(0xffD9DBDB)),
                            ),
                          ),
                          newcontainer(
                            text: Text(
                              matches,
                              style: TextStyle(fontSize: 35),
                            ),
                            subtitle: Text('Matches',
                                style: GoogleFonts.aBeeZee(
                                    color: Color(0xffD9DBDB))),
                          ),
                          newcontainer(
                            text: Text(
                              dates,
                              style: TextStyle(fontSize: 35),
                            ),
                            subtitle: Text('Dates',
                                style: GoogleFonts.aBeeZee(
                                    color: Color(0xffD9DBDB))),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              });
        });
  }

  Widget tophalf() {
    return Container(
      height: tophalfheight,
      color: Color(0xffCCEF2B),
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          boxbutton(
            color: Colors.white,
            icon: Icon(Icons.arrow_back_ios),
            onpress: () {},
          ),
          Text(
            'My Profile',
            style:
                GoogleFonts.aclonica(fontWeight: FontWeight.w900, fontSize: 20),
          ),
          boxbutton(
            color: Color(0xffF8E006),
            onpress: () {
              showBottomSheet(
                  clipBehavior: Clip.none,
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 500,
                      width: 500,
                      decoration: const BoxDecoration(
                        color: Color(0xffBEA0FF),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(12)),
                            height: 9,
                            width: 70,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: profilepic == null
                                ? FileImage(nullimage)
                                : FileImage(profilepic!),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'Change profile picture',
                              style: GoogleFonts.aBeeZee(color: Colors.blue),
                            ),
                          ),
                          Text('$hobbies')
                        ],
                      ),
                    );
                  });
            },
            icon: LineIcon.userEdit(),
          ),
        ],
      ),
    );
  }

  Widget profilepicture() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(120, 0, 120, 0),
      child: Container(
        width: imagecontainerwidth,
        height: imagecontainerheight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Image.file(profilepic!),
      ),
    );
  }
}

class newcontainer extends StatefulWidget {
  Widget text;
  Widget subtitle;
  newcontainer({required this.subtitle, required this.text});
  @override
  State<newcontainer> createState() => _newcontainerState();
}

class _newcontainerState extends State<newcontainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: MaterialButton(
          child: Column(
            children: [widget.text, widget.subtitle],
          ),
          height: 55,
          color: Color(0xffFFFFFF),
          elevation: 8,
          onPressed: () {
            print('pressed');
          },
        ),
      ),
    );
  }
}

class boxbutton extends StatelessWidget {
  Function()? onpress;
  Icon? icon;
  Color? color;
  boxbutton({required this.onpress, this.icon, this.color});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        child: MaterialButton(
          color: color,
          elevation: 2,
          onPressed: onpress,
          child: icon,
        ),
      ),
    );
  }
}
