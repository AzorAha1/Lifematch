import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifematch/constants.dart';
import 'package:lifematch/screens/mainpage.dart';
import 'package:line_icons/line_icon.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Picturesandbios extends StatefulWidget {
  const Picturesandbios({super.key});

  @override
  State<Picturesandbios> createState() => _PicturesandbiosState();
}

class _PicturesandbiosState extends State<Picturesandbios> {
  bool Loading = false;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: Loading,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Form(
                key: _formkey,
                child: Theme(
                  data: ThemeData(
                      accentColor: Colors.red, primarySwatch: Colors.red),
                  child: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 2, left: 20),
                              child: InkWell(
                                child: Icon(Icons.arrow_back_ios),
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              height: 50,
                            ),
                            Text(
                              'Step 2 of 4',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, bottom: 30),
                          child: Text(
                            'Add Pictures',
                            style: GoogleFonts.aBeeZee(fontSize: 30),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: GridView.count(
                              crossAxisCount: 3,
                              children: [
                                pictureadd(
                                  onpress: () {},
                                ),
                                pictureadd(
                                  onpress: () {},
                                ),
                                pictureadd(
                                  onpress: () {},
                                ),
                                pictureadd(
                                  onpress: () {},
                                ),
                                pictureadd(
                                  onpress: () {},
                                ),
                                pictureadd(
                                  onpress: () {},
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'Bio',
                            style: GoogleFonts.aBeeZee(
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter something about you';
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Write about yourself 😁',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                        newbutton(
                          text: Text('Next'),
                          onpress: () {
                            if (_formkey.currentState!.validate()) {
                              setState(() {
                                Loading = true;
                              });
                              Navigator.pushNamed(context, '/preferences');
                              setState(() {
                                Loading = false;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class pictureadd extends StatefulWidget {
  Function()? onpress;

  pictureadd({required this.onpress});
  State<pictureadd> createState() => _pictureaddState();
}

class _pictureaddState extends State<pictureadd> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: GestureDetector(
        onTap: widget.onpress,
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 212, 207, 207),
              borderRadius: BorderRadius.circular(20)),
          child: LineIcon.plus(
            color: Color.fromARGB(255, 233, 79, 68),
          ),
        ),
      ),
    );
  }
}
