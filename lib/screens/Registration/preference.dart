import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifematch/main.dart';
import 'package:lifematch/screens/mainpage.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

const activeColor = Color.fromARGB(255, 237, 69, 69);
const inactiveColor = Color.fromARGB(255, 173, 173, 173);
RangeValues rangeValues = RangeValues(18, 99);

class Preferences extends StatefulWidget {
  const Preferences({Key? key}) : super(key: key);

  @override
  State<Preferences> createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String selectedsex = '';
    Color mancardColor = inactiveColor;
    Color womancardColor = inactiveColor;
    dynamic min = rangeValues.start;
    dynamic max = rangeValues.end;
  }

  Map data = {};
  bool Loading = false;
  String selectedsex = '';
  Color mancardColor = inactiveColor;
  Color womancardColor = inactiveColor;
  int age = 0;

  dynamic min = rangeValues.start;
  dynamic max = rangeValues.end;

  void update({int? sex}) {
    if (sex == 1) {
      selectedsex = 'Male';
      if (mancardColor == inactiveColor) {
        mancardColor = activeColor;
        womancardColor = inactiveColor;
      } else {
        mancardColor = inactiveColor;
      }
    }
    if (sex == 2) {
      selectedsex = 'Female';
      if (womancardColor == inactiveColor) {
        womancardColor = activeColor;
        mancardColor = inactiveColor;
      } else {
        womancardColor = inactiveColor;
      }
    }
    if (sex != 1 && sex != 2) {
      setState(() {
        selectedsex = 'not selected yet';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Screenwidth = MediaQuery.of(context).size.width;
    final Screenheight = MediaQuery.of(context).size.height;
    data = ModalRoute.of(context)?.settings.arguments as Map;
    String location = data['location'];
    String dateofbirth = data['dob'];
    String gender = data['gender'];
    String bio = data['bio'];
    File? img1 = data['img1'];
    File? img2 = data['img2'];
    File? img3 = data['img3'];
    File? img4 = data['img4'];
    File? img5 = data['img5'];
    File? img6 = data['img6'];

    return SafeArea(
      child: ModalProgressHUD(
        progressIndicator: CircularProgressIndicator(
          color: Colors.red,
        ),
        inAsyncCall: Loading,
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.all(Screenwidth * 0.02),
                      child: Icon(Icons.arrow_back_ios),
                    ),
                  ),
                  SizedBox(
                    width: Screenwidth * 0.3,
                  ),
                  Text(
                    'Step 3 of 5',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: Screenheight * 0.1,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: Screenwidth * 0.02, bottom: Screenheight * 0.09),
                child: Text(
                  'I am interested in',
                  style: GoogleFonts.aBeeZee(
                      fontSize: Screenheight * 0.05,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            update(sex: 1);
                          });
                        },
                        child: newcontainer(
                          color: mancardColor,
                          text: Text(
                            'Men',
                            style: GoogleFonts.aBeeZee(),
                          ),
                        )),
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        update(sex: 2);
                      });
                    },
                    child: newcontainer(
                        color: womancardColor,
                        text: Text(
                          'Women',
                          style: GoogleFonts.aBeeZee(),
                        )),
                  )),
                ],
              ),
              SizedBox(
                height: Screenheight * 0.05,
              ),
              Padding(
                padding: EdgeInsets.only(left: Screenwidth * 0.75),
                child: Text(
                  '${rangeValues.start.round().toString()} - ${rangeValues.end.round().toString()} years',
                  style: GoogleFonts.aBeeZee(
                      color: inactiveColor, fontWeight: FontWeight.bold),
                ),
              ),
              RangeSlider(
                  divisions: 99,
                  labels: RangeLabels(rangeValues.start.round().toString(),
                      rangeValues.end.round().toString()),
                  inactiveColor: inactiveColor,
                  activeColor: activeColor,
                  max: 99,
                  values: rangeValues,
                  onChanged: (value) {
                    setState(() {
                      rangeValues = value;
                    });
                  }),
              SizedBox(
                height: Screenheight * 0.08,
              ),
              newbutton(
                  text: Text('Next'),
                  onpress: () async {
                    setState(() {
                      Loading = true;
                    });
                    print(selectedsex);
                    print(
                        "${min.round().toString()} is the min age i'm dating\n ${max.round().toString()} is the max age i'm dating");
                    await Future.delayed(Duration(seconds: 2), () {
                      Navigator.pushNamed(context, Routes.interests.name,
                          arguments: {
                            'location': location,
                            'dob': dateofbirth,
                            'gender': gender,
                            'interest': selectedsex,
                            'bio': bio,
                            'minimumage': min.toString(),
                            'maximumage': max.toString(),
                            'img1': img1,
                            'img2': img2,
                            'img3': img3,
                            'img4': img4,
                            'img5': img5,
                            'img6': img6,
                          });
                    });

                    setState(() {
                      Loading = false;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class newcontainer extends StatefulWidget {
  Widget? text;
  newcontainer({this.text, this.color});
  Color? color;

  @override
  State<newcontainer> createState() => _newcontainerState();
}

class _newcontainerState extends State<newcontainer> {
  @override
  Widget build(BuildContext context) {
    final Screenheight = MediaQuery.of(context).size.height;
    final Screenwidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(Screenheight * 0.01),
      child: Container(
        child: Center(child: widget.text),
        height: Screenheight * 0.07,
        width: Screenwidth * 0.05,
        decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(Screenwidth * 0.08)),
      ),
    );
  }
}
