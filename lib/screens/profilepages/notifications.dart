import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool? switched = false;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 226, 224, 224),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: screenHeight * 0.06,
                left: screenWidth * 0.05,
                bottom: screenHeight * 0.05),
            child: Row(
              children: [
                InkWell(
                  child: Icon(
                    Icons.arrow_back_ios,
                  ),
                  onTap: () => Navigator.pop(context),
                ),
                SizedBox(
                  width: 70,
                ),
                Text(
                  'Notifications Settings',
                  style: TextStyle(
                      fontSize: screenHeight * 0.023,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, border: Border.all(color: Colors.black26)),
            width: screenWidth,
            height: screenHeight * 0.07,
            child: Row(
              children: [
                CupertinoSwitch(
                  activeColor: Colors.black,
                    value: switched!,
                    onChanged: (value) {
                      setState(() {
                        switched = value;
                      });
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
