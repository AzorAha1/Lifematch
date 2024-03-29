import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifematch/screens/homepagetabs/chatpage.dart';
import 'package:lifematch/screens/homepagetabs/likepage.dart';
import 'package:lifematch/screens/homepagetabs/mainhome.dart';
import 'package:lifematch/screens/mainpage.dart';
import 'package:line_icons/line_icons.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lifematch/screens/homepagetabs/accountinfo.dart';

import 'homepagetabs/newaccountinfo.dart';

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
    NewAccountinfo(),
    
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
    final Screenwidth = MediaQuery.of(context).size.width;
    final Screenheight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        
        bottomNavigationBar: Container(
          color: Color(0xffBEA0FF),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Screenwidth * 0.02,vertical: Screenheight * 0.01),
            child: GNav(
              onTabChange: (value) {
                setState(() {
                  _currentindex = value;
                });
              },
              
              tabBorderRadius: Screenheight * 0.02,
              tabBackgroundColor: Colors.black.withOpacity(0.2),
              backgroundColor:Color(0xffBEA0FF),
              selectedIndex: _currentindex,
              padding: EdgeInsets.all(Screenwidth * 0.05),
              iconSize: Screenheight * 0.02,
              gap: 8,
              tabs: [
                GButton(
                  haptic: true,
                  icon: LineIcons.home,
                  iconColor: Colors.white,
                  iconSize: Screenheight * 0.025,
                  text: 'Home',
                  textColor: Colors.white,
                  iconActiveColor: Color(0xffBEA0FF),
                ),
                GButton(
                  haptic: true,
                  icon: LineIcons.heart,
                  iconColor: Colors.white,
                  iconSize: Screenheight * 0.025,
                  text: 'Likes',
                  textColor: Colors.white,
                  iconActiveColor: Color(0xffBEA0FF),
                ),
                GButton(
                  haptic: true,
                  icon: LineIcons.facebookMessenger,
                  iconSize: Screenheight * 0.025,
                  text: 'Chats',
                  textColor: Colors.white,
                  iconColor: Colors.white,
                  iconActiveColor: Color(0xffBEA0FF),
                ),
                GButton(
                  haptic: true,
                  icon: Ionicons.person,
                  text: 'Account',
                  textColor: Colors.white,
                  iconColor:Colors.white,
                  iconActiveColor: Color(0xffBEA0FF),
                ),
              ],
            ),
          ),
        ),
        body: pages[_currentindex],
      ),
    );
  }
}
