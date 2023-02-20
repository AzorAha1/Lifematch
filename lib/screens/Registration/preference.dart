import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifematch/screens/mainpage.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

const activeColor = Color.fromARGB(255, 237, 69, 69);
const inactiveColor = Color.fromARGB(255, 173, 173, 173);

class Preferences extends StatefulWidget {
  const Preferences({Key? key}) : super(key: key);

  @override
  State<Preferences> createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {
  bool Loading = false;
  String selectedsex = '';
  Color mancardColor = inactiveColor;
  Color womancardColor = inactiveColor;
  int age = 0;
  RangeValues rangeValues = RangeValues(18, 99);

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
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.arrow_back_ios),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                  ),
                  Text(
                    'Step 3 of 4',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 60),
                child: Text(
                  'I am interested in',
                  style: GoogleFonts.aBeeZee(
                      fontSize: 40, fontWeight: FontWeight.w900),
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
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 300),
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
                height: 50,
              ),
              newbutton(
                  text: Text('Next'),
                  onpress: () async {
                     setState(() {
                      Loading = true;
                    });
                    print(selectedsex);
                    print(
                        "${rangeValues.start.round().toString()} is the min age i'm dating\n ${rangeValues.end.round().toString()} is the max age i'm dating");
                    await Future.delayed(Duration(seconds: 2), (){
                       Navigator.pushNamed(context, '/interests');
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Center(child: widget.text),
        height: 55,
        width: 180,
        decoration: BoxDecoration(
            color: widget.color, borderRadius: BorderRadius.circular(25)),
      ),
    );
  }
}
