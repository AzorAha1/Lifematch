import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lifematch/Database/auth.dart';
import 'package:lifematch/constants.dart';
import 'package:lifematch/main.dart';
import 'package:lifematch/screens/mainpage.dart';
import 'package:line_icons/line_icon.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Picturesandbios extends StatefulWidget {
  const Picturesandbios({super.key});

  @override
  State<Picturesandbios> createState() => _PicturesandbiosState();
}

class _PicturesandbiosState extends State<Picturesandbios> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    File? imagefile;
    File? imagefile2;
    File? imagefile3;
    File? imagefile4;
    File? imagefile5;
    File? imagefile6;
    String bio = '';
  }

  Map data = {};
  File? imagefile;
  File? imagefile2;
  File? imagefile3;
  File? imagefile4;
  File? imagefile5;
  File? imagefile6;
  String bio = '';

  @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   imagefile;
  //   imagefile2;
  //   imagefile3;
  //   imagefile4;
  //   imagefile5;
  //   imagefile6;
  // }

  bool Loading = false;
  final _formkey = GlobalKey<FormState>();
  TextEditingController bio_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Screenheight = MediaQuery.of(context).size.height;
    final Screenwidth = MediaQuery.of(context).size.width;
    data = ModalRoute.of(context)?.settings.arguments as Map;
    String location = data['location'];
    String dateofbirth = data['dob'];
    String gender = data['gender'];
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
                              padding: EdgeInsets.only(
                                  top: Screenheight * 0.01,
                                  left: Screenwidth * 0.04),
                              child: InkWell(
                                child: Icon(Icons.arrow_back_ios),
                              ),
                            ),
                            SizedBox(
                              width: Screenwidth * 0.30,
                              height: Screenheight * 0.03,
                            ),
                            Text(
                              'Step 2 of 5',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Screenheight * 0.05,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: Screenwidth * 0.1,
                              bottom: Screenheight * 0.03),
                          child: Text(
                            'Add Pictures',
                            style: GoogleFonts.aBeeZee(
                                fontSize: Screenheight * 0.035),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: Screenwidth * 0.02,
                                right: Screenwidth * 0.02),
                            child: GridView.count(
                              crossAxisCount: 3,
                              children: [
                                pictureadd(
                                  child: imagefile == null
                                      ? LineIcon(
                                          Icons.add,
                                          color: Colors.red,
                                        )
                                      : Image.file(
                                          imagefile!,
                                          fit: BoxFit.cover,
                                        ),
                                  onpress: () async {
                                    final newfile =
                                        await ImagePicker().pickImage(
                                      source: ImageSource.gallery,
                                    );
                                    if (newfile != null) {
                                      setState(() {
                                        imagefile = File(
                                          newfile.path,
                                        );
                                      });
                                    }
                                  },
                                ),
                                pictureadd(
                                  child: imagefile2 == null
                                      ? LineIcon(
                                          Icons.add,
                                          color: Colors.red,
                                        )
                                      : Image.file(
                                          imagefile2!,
                                          fit: BoxFit.cover,
                                        ),
                                  onpress: () async {
                                    final newfile2 = await ImagePicker()
                                        .pickImage(source: ImageSource.gallery);
                                    if (newfile2 != null) {
                                      setState(() {
                                        imagefile2 = File(newfile2.path);
                                      });
                                    }
                                  },
                                ),
                                pictureadd(
                                  child: imagefile3 == null
                                      ? LineIcon(
                                          Icons.add,
                                          color: Colors.red,
                                        )
                                      : Image.file(
                                          imagefile3!,
                                          fit: BoxFit.cover,
                                        ),
                                  onpress: () async {
                                    var newfile3 = await ImagePicker()
                                        .pickImage(source: ImageSource.gallery);
                                    if (newfile3 != null) {
                                      setState(() {
                                        imagefile3 = File(newfile3.path);
                                      });
                                    }
                                  },
                                ),
                                pictureadd(
                                  child: imagefile4 == null
                                      ? LineIcon(
                                          Icons.add,
                                          color: Colors.red,
                                        )
                                      : Image.file(
                                          imagefile4!,
                                          fit: BoxFit.cover,
                                        ),
                                  onpress: () async {
                                    final newfile4 = await ImagePicker()
                                        .pickImage(source: ImageSource.gallery);
                                    if (newfile4 != null) {
                                      setState(() {
                                        imagefile4 = File(newfile4.path);
                                      });
                                    }
                                  },
                                ),
                                pictureadd(
                                  child: imagefile5 == null
                                      ? LineIcon(
                                          Icons.add,
                                          color: Colors.red,
                                        )
                                      : Image.file(
                                          imagefile5!,
                                          fit: BoxFit.cover,
                                        ),
                                  onpress: () async {
                                    final newfile5 = await ImagePicker()
                                        .pickImage(source: ImageSource.gallery);
                                    if (newfile5 != null) {
                                      setState(() {
                                        imagefile5 = File(newfile5.path);
                                      });
                                    }
                                  },
                                ),
                                pictureadd(
                                  child: imagefile6 == null
                                      ? LineIcon(
                                          Icons.add,
                                          color: Colors.red,
                                        )
                                      : Image.file(
                                          imagefile6!,
                                          fit: BoxFit.cover,
                                        ),
                                  onpress: () async {
                                    final newfile6 = await ImagePicker()
                                        .pickImage(source: ImageSource.gallery);
                                    if (newfile6 != null) {
                                      setState(() {
                                        imagefile6 = File(newfile6.path);
                                      });
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: Screenwidth * 0.05,
                                right: Screenwidth * 0.05),
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  bio = value;
                                });
                              },
                              controller: bio_controller,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter something about you';
                                }
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    left: Screenwidth * 0.03,
                                    top: Screenheight * 0,
                                    bottom: Screenheight * 0.16),
                                label: Text('Bio'),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
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

                              Navigator.pushNamed(
                                  context, Routes.preferences.name,
                                  arguments: {
                                    'location': location,
                                    'dob': dateofbirth,
                                    'gender': gender,
                                    'bio': bio_controller.text,
                                    'img1': imagefile,
                                    'img2': imagefile2,
                                    'img3': imagefile3,
                                    'img4': imagefile4,
                                    'img5': imagefile5,
                                    'img6': imagefile6,
                                  });
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
  Widget? child;
  Function()? onlongpress;

  pictureadd({required this.onpress, this.child, this.onlongpress});
  State<pictureadd> createState() => _pictureaddState();
}

class _pictureaddState extends State<pictureadd> {
  @override
  Widget build(BuildContext context) {
    final Screenwidth = MediaQuery.of(context).size.width;
    final Screenheight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.all(Screenwidth * 0.03),
      child: GestureDetector(
        onLongPress: widget.onlongpress,
        onTap: widget.onpress,
        child: Container(
          height: Screenheight * 0.05,
          width: Screenwidth * 0.05,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 212, 207, 207),
              borderRadius: BorderRadius.circular(Screenwidth * 0.05)),
          child: widget.child,
        ),
      ),
    );
  }
}
