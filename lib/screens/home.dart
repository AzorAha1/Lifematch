import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifematch/screens/homepagetabs/chatpage.dart';
import 'package:lifematch/screens/homepagetabs/likepage.dart';
import 'package:lifematch/screens/homepagetabs/mainhome.dart';
import 'package:lifematch/screens/homepagetabs/searchpage.dart';
import 'package:lifematch/screens/mainpage.dart';
import 'package:line_icons/line_icons.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentindex = 0;
  final _auth = FirebaseAuth.instance;
  User? user;
  bool Loading = false;
  final pages = [
    mainhome(),
    Likepage(),
    Chatpage(),
    Searchpage(),
  ];
  @override
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
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: GNav(
          onTabChange: (value) {
            setState(() {
              _currentindex = value;
            });
          },
          tabBackgroundColor: Colors.red.withOpacity(0.2),
          backgroundColor: Colors.purple.withOpacity(0.1),
          selectedIndex: _currentindex,
          padding: EdgeInsets.all(20),
          gap: 10,
          tabs: const [
            GButton(
              haptic: true,
              icon: LineIcons.home,
              iconSize: 30,
              text: 'Home',
              textColor: Colors.white,
            ),
            GButton(
              haptic: true,
              icon: LineIcons.heart,
              iconSize: 30,
              text: 'Likes',
              textColor: Colors.white,
            ),
            GButton(
              haptic: true,
              icon: LineIcons.facebookMessenger,
              iconSize: 30,
              text: 'Chats',
              textColor: Colors.white,
            ),
            GButton(
              haptic: true,
              icon: LineIcons.search,
              text: 'Search',
              textColor: Colors.white,
            ),
          ],
        ),
        body: pages[_currentindex],
      ),
    );
  }
}
