import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifematch/Database/auth.dart';
import 'package:lifematch/constants.dart';
import 'package:lifematch/main.dart';
import 'package:lifematch/screens/mainpage.dart';
import 'package:line_icons/line_icons.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:country_pickers/countries.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:intl/intl.dart';

DateTime _currentdate = DateTime.now();

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  List<String> allcount = [
    '*Choose a Country*',
    'Afghanistan',
    'Albania',
    'Algeria',
    'Andorra',
    'Angola',
    'Antigua and Barbuda',
    'Argentina',
    'Armenia',
    'Australia',
    'Austria',
    'Austrian Empire',
    'Azerbaijan',
    'Baden',
    'Bahamas',
    'Bahrain',
    'Bangladesh',
    'Barbados',
    'Bavaria',
    'Belarus',
    'Belgium',
    'Belize',
    'Benin (Dahomey)',
    'Bolivia',
    'Bosnia and Herzegovina',
    'Botswana',
    'Brazil',
    'Brunei',
    'Brunswick and Lüneburg',
    'Bulgaria',
    'Burkina Faso (Upper Volta)',
    'Burma',
    'Burundi',
    'Cabo Verde',
    'Cambodia',
    'Cameroon',
    'Canada',
    'Cayman Islands',
    'Central African Republic',
    'Central American Federation',
    'Chad',
    'Chile',
    'China',
    'Colombia',
    'Comoros',
    'Congo Free State',
    'Costa Rica',
    "Cote d'Ivoire (Ivory Coast)",
    'Croatia',
    'Cuba',
    'Cyprus',
    'Czechia',
    'Czechoslovakia',
    'Democratic Republic of the Congo',
    'Denmark',
    'Djibouti',
    'Dominica',
    'Dominican Republic',
    'Duchy of Parma',
    'Ecuador',
    'Egypt',
    'El Salvador',
    'Equatorial Guinea',
    'Eritrea',
    'Estonia',
    'Eswatini',
    'Ethiopia',
    'Fiji',
    'Finland',
    'France',
    'Gabon',
    'Gambia',
    'Georgia',
    'Germany',
    'Ghana',
    'Grand Duchy of Tuscany',
    'Greece',
    'Grenada',
    'Guatemala',
    'Guinea',
    'Guinea-Bissau',
    'Guyana',
    'Haiti',
    'Hanover',
    'Hanseatic Republics',
    'Hawaii',
    'Hesse',
    'Holy See',
    'Honduras',
    'Hungary',
    'Iceland',
    'India',
    'Indonesia',
    'Iran',
    'Iraq',
    'Ireland',
    'Israel',
    'Italy',
    'Jamaica',
    'Japan',
    'Jordan',
    'Kazakhstan',
    'Kenya',
    'Kingdom of Serbia/Yugoslavia',
    'Kiribati',
    'Korea',
    'Kosovo',
    'Kuwait',
    'Laos',
    'Latvia',
    'Lebanon',
    'Lesotho',
    'Lew Chew (Loochoo)',
    'Liberia',
    'Libya',
    'Liechtenstein',
    'Lithuania',
    'Luxembourg',
    'Madagascar',
    'Malawi',
    'Malaysia',
    'Maldives',
    'Mali',
    'Malta',
    'Marshall Islands',
    'Mauritania',
    'Mauritius',
    'Mecklenburg-Schwerin',
    'Mecklenburg-Strelitz',
    'Mexico',
    'Micronesia',
    'Moldova',
    'Monaco',
    'Mongolia',
    'Montenegro',
    'Morocco',
    'Mozambique',
    'Namibia',
    'Nassau',
    'Nauru',
    'Nepal',
    'Netherlands',
    'New Zealand',
    'Nicaragua',
    'Niger',
    'Nigeria',
    'North German Confederation',
    'North German Union',
    'North Macedonia',
    'Norway',
    'Oldenburg',
    'Oman',
    'Orange Free State',
    'Pakistan',
    'Palau',
    'Palastine',
    'Panama',
    'Papal States',
    'Papua New Guinea',
    'Paraguay',
    'Peru',
    'Philippines',
    'Piedmont-Sardinia',
    'Poland',
    'Portugal',
    'Qatar',
    'Republic of Genoa',
    'Republic of Korea (South Korea)',
    'Republic of the Congo',
    'Romania',
    'Russia',
    'Rwanda',
    'Saint Kitts and Nevis',
    'Saint Lucia',
    'Saint Vincent and the Grenadines',
    'Samoa',
    'San Marino',
    'Sao Tome and Principe',
    'Saudi Arabia',
    'Schaumburg-Lippe',
    'Senegal',
    'Serbia',
    'Seychelles',
    'Sierra Leone',
    'Singapore',
    'Slovakia',
    'Slovenia',
    'Solomon Islands',
    'Somalia',
    'South Africa',
    'South Sudan',
    'Spain',
    'Sri Lanka',
    'Sudan',
    'Suriname',
    'Sweden',
    'Switzerland',
    'Syria',
    'Tajikistan',
    'Tanzania',
    'Texas',
    'Thailand',
    'Timor-Leste',
    'Togo',
    'Tonga',
    'Trinidad and Tobago',
    'Tunisia',
    'Turkey',
    'Turkmenistan',
    'Tuvalu',
    'Two Sicilies',
    'Uganda',
    'Ukraine',
    'Union of Soviet Socialist Republics',
    'United Arab Emirates',
    'United Kingdom',
    'Uruguay',
    'Uzbekistan',
    'Vanuatu',
    'Venezuela',
    'Vietnam',
    'Württemberg',
    'Yemen',
    'Zambia',
    'Zimbabwe',
  ];
  String _dropdownvalue = '';
  void dropdown({String? value}) {
    if (value is String) {
      setState(() {
        _dropdownvalue = value;
      });
    }
  }

  String formatteddate = DateFormat('dd/MM/yyyy').format(_currentdate);
  String? selectedcountry = '*Choose a Country*';
  String email = '';
  String password = '';
  String dateofbirth = '';
  String newlocation = '';
  String error = '';
  bool iscompleted = false;
  bool Loading = false;
  String bio = '';
  String _selectedgender = 'empty';
  TextEditingController dob_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  final age_controller = TextEditingController();
  final name_controller = TextEditingController();
  final bio_controller = TextEditingController();
  TextEditingController location_controller = TextEditingController();
  TextEditingController gender_controller = TextEditingController();
  final confirm_password_controller = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  int _currentstep = 0;

  String? currentuseruid;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentuseruid = FirebaseAuth.instance.currentUser?.uid;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    currentuseruid = FirebaseAuth.instance.currentUser!.uid;
    confirm_password_controller.dispose();
    age_controller.dispose();
    bio_controller.dispose();
    dob_controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Screenheight = MediaQuery.of(context).size.height;
    final Screenwidth = MediaQuery.of(context).size.width;
    return ModalProgressHUD(
      inAsyncCall: Loading,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SafeArea(
                  child: Form(
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
                                      top: Screenheight * 0.001,
                                      left: Screenwidth * 0.04),
                                  child: InkWell(
                                    child: Icon(Icons.arrow_back_ios),
                                    onTap: () {
                                      Navigator.pushReplacementNamed(
                                          context, Routes.main.name);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: Screenwidth * 0.32,
                                  height: Screenheight * 0.09,
                                ),
                                Text(
                                  'Step 1 of 5',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: Screenwidth * 0.035),
                                ),
                              ],
                            ),
                            // Text(_currentdate.toString()),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: Screenwidth * 0.05),
                              child: Text(
                                'Profile info',
                                style: GoogleFonts.aBeeZee(
                                    fontSize: Screenheight * 0.04),
                              ),
                            ),
                            SizedBox(
                              height: Screenheight * 0.05,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: Screenwidth * 0.05,
                                  left: Screenwidth * 0.05,
                                  bottom: Screenheight * 0.02),
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Empty Field';
                                  }
                                },
                                controller: email_controller,
                                onChanged: (value) {
                                  setState(() {
                                    email = value;
                                  });
                                },
                                decoration: ktextformfield.copyWith(
                                  hintText: 'Username or Email',
                                  hintStyle: GoogleFonts.aBeeZee(),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: Screenwidth * 0.05,
                                  left: Screenwidth * 0.05,
                                  bottom: Screenheight * 0.02),
                              child: TextFormField(
                                obscureText: true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Empty Field';
                                  }
                                },
                                controller: password_controller,
                                onChanged: (value) {
                                  setState(() {
                                    password = value;
                                  });
                                },
                                decoration: ktextformfield.copyWith(
                                    hintText: 'Password',
                                    hintStyle: GoogleFonts.aBeeZee()),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: Screenwidth * 0.05,
                                  left: Screenwidth * 0.05,
                                  bottom: Screenheight * 0.02),
                              child: Stack(
                                children: [
                                  TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Empty Field';
                                      }
                                    },
                                    controller: dob_controller,
                                    onChanged: (value) {},
                                    decoration: ktextformfield.copyWith(
                                        hintText: 'Date of Birth',
                                        hintStyle: GoogleFonts.aBeeZee()),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: Screenwidth * 0.8,
                                        top: Screenheight * 0.02),
                                    child: InkWell(
                                      onTap: () {
                                        showdaytime().then((value) {
                                          setState(() {
                                            _currentdate = value;

                                            dob_controller.text = value
                                                .toString()
                                                .substring(0, 10);
                                          });
                                        });
                                      },
                                      child:
                                          Icon(Icons.calendar_month_outlined),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: Screenwidth * 0.05,
                                left: Screenwidth * 0.05,
                              ),
                              child: Stack(children: [
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Empty Field';
                                    }
                                  },
                                  controller: gender_controller,
                                  onChanged: (value) {},
                                  decoration: ktextformfield.copyWith(
                                      hintText: 'Gender',
                                      hintStyle: GoogleFonts.aBeeZee()),
                                ),
                                SizedBox(
                                  height: Screenheight * 0.09,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: Screenwidth * 0.65),
                                  child: DropdownButton<String>(
                                    value: _selectedgender,
                                    items: [
                                      DropdownMenuItem(
                                        child: Text(
                                          '*Empty*',
                                          style: GoogleFonts.aBeeZee(
                                              fontSize: Screenheight * 0.017),
                                        ),
                                        value: 'empty',
                                      ),
                                      DropdownMenuItem(
                                        child: Text(
                                          'Male',
                                          style: GoogleFonts.aBeeZee(
                                              fontSize: Screenheight * 0.017),
                                        ),
                                        value: 'male',
                                      ),
                                      DropdownMenuItem(
                                        child: Text(
                                          'Female',
                                          style: GoogleFonts.aBeeZee(
                                              fontSize: Screenheight * 0.017),
                                        ),
                                        value: 'female',
                                      ),
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedgender = value!;
                                        gender_controller.text =
                                            value.toString().toUpperCase();
                                      });
                                    },
                                  ),
                                ),
                              ]),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: Screenwidth * 0.02,
                                left: Screenwidth * 0.02,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: Screenwidth * 0.05,
                                  right: Screenwidth * 0.05),
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Empty Field';
                                  }
                                },
                                controller: location_controller,
                                onChanged: (value) {},
                                decoration: ktextformfield.copyWith(
                                    hintText: 'Location',
                                    hintStyle: GoogleFonts.aBeeZee()),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: Screenwidth * 0.17,
                                  top: Screenheight * 0.02,
                                  bottom: Screenheight * 0.03),
                              child: DropdownButton<String>(
                                value: selectedcountry,
                                onChanged: (value) {
                                  setState(() {
                                    selectedcountry = value!;
                                    location_controller.text = value.toString();
                                  });
                                },
                                items: allcount.map((e) {
                                  return DropdownMenuItem(
                                    child: Text(e.toString()),
                                    value: e,
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(
                              height: Screenheight * 0.02,
                            ),
                            newbutton(
                                text: Text('Next',
                                    style: GoogleFonts.aBeeZee(
                                        color: Color.fromARGB(
                                            255, 228, 225, 225))),
                                onpress: () async {
                                  if (_formkey.currentState!.validate()) {
                                    setState(() {
                                      Loading = true;
                                    });
                                    dynamic result = await Database(
                                            uid: currentuseruid)
                                        .signupWithEmailandPassword(
                                            email: email_controller.text,
                                            password: password_controller.text);

                                    if (result != null) {
                                      Database(uid: currentuseruid).adduserinfo(
                                          gender: gender_controller.text,
                                          country: location_controller.text,
                                          dateofbirth: _currentdate
                                              .toString()
                                              .substring(1, 10));
                                      Navigator.pushNamed(
                                          context, Routes.picturesandbios.name,
                                          arguments: {
                                            'location':
                                                location_controller.text,
                                            'dob': formatteddate.toString(),
                                            'gender': gender_controller.text,
                                          });
                                      setState(() {
                                        Loading = false;
                                      });
                                      print(_currentdate.toString());
                                      print(email_controller.text);
                                      print(location_controller.text);
                                      print(gender_controller.text);
                                    }
                                  }
                                })
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> showdaytime() {
    return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.utc(1980),
        lastDate: DateTime.utc(2025));
  }

  // List<Step> getsteps() => [
  //       Step(
  //         isActive: _currentstep >= 0,
  //         title: Text('Step 1 of 6'),
  //         content: TextFormField(
  //           validator: (value) {
  //             if (value!.isEmpty) {
  //               return 'Empty Field';
  //             }
  //           },
  //           controller: email_controller,
  //           onChanged: (value) {
  //             setState(() {
  //               email = value;
  //             });
  //           },
  //           decoration: ktextformfield.copyWith(
  //               hintText: 'Username or Email',
  //               hintStyle: GoogleFonts.aBeeZee()),
  //         ),
  //       ),
  //       Step(
  //         isActive: _currentstep >= 1,
  //         title: Text('Step 2 of 6'),
  //         content: Column(
  //           children: [
  //             TextFormField(
  //               validator: (value) {
  //                 if (value!.length < 6) {
  //                   return 'Password needs to be 6+ chars';
  //                 }
  //               },
  //               obscureText: true,
  //               controller: password_controller,
  //               onChanged: (value) {
  //                 setState(() {
  //                   password = value;
  //                 });
  //               },
  //               decoration: ktextformfield.copyWith(
  //                   hintText: 'Password', hintStyle: GoogleFonts.aBeeZee()),
  //             ),
  //             SizedBox(
  //               height: 10,
  //             ),
  //             TextFormField(
  //               validator: (value) {
  //                 if (value != password_controller.text) {
  //                   return "Doesn't Match Password";
  //                 }
  //               },
  //               obscureText: true,
  //               controller: confirm_password_controller,
  //               decoration: ktextformfield.copyWith(
  //                   hintText: 'Confirm Password',
  //                   hintStyle: GoogleFonts.aBeeZee()),
  //             ),
  //           ],
  //         ),
  //       ),
  //       Step(
  //         isActive: _currentstep >= 3,
  //         title: Text('Step 3 of 6'),
  //         content: TextFormField(
  //           validator: (value) {
  //             if (value!.isEmpty) {
  //               return 'Empty field';
  //             }
  //           },
  //           controller: name_controller,
  //           decoration: ktextformfield.copyWith(
  //               hintText: 'Name', hintStyle: GoogleFonts.aBeeZee()),
  //         ),
  //       ),
  //       Step(
  //           isActive: _currentstep >= 4,
  //           title: Text('Step 4 of 6'),
  //           content: TextFormField(
  //             decoration: ktextformfield,
  //             controller: bio_controller,
  //             validator: (value) {
  //               if (value!.length <= 10) {
  //                 return 'Info page needs to be 10+ chars';
  //               } else if (value.length > 50) {
  //                 return 'keep info page to less 10-49 chars';
  //               }
  //             },
  //           )),
  //       Step(
  //           isActive: _currentstep >= 5,
  //           title: Text('Step 5 of 6'),
  //           content: DropdownButton(
  //             value: selectedcountry,
  //             onChanged: (value) {
  //               setState(() {
  //                 selectedcountry = value!;
  //               });
  //             },
  //             items: allcount.map((e) {
  //               return DropdownMenuItem(
  //                 child: Text(e),
  //                 value: e,
  //               );
  //             }).toList(),
  //           )),
  //       Step(
  //         isActive: _currentstep >= 6,
  //         title: Text('Step 6 of 6'),
  //         content: Container(
  //           decoration: BoxDecoration(
  //             border: Border.all(color: Colors.red),
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //           child: DropdownButton<String>(
  //             value: _selectedgender,
  //             items: [
  //               DropdownMenuItem(
  //                 child: Text(
  //                   '*Empty*',
  //                   style: GoogleFonts.aBeeZee(fontSize: 15),
  //                 ),
  //                 value: 'empty',
  //               ),
  //               DropdownMenuItem(
  //                 child: Text(
  //                   'Male',
  //                   style: GoogleFonts.aBeeZee(fontSize: 15),
  //                 ),
  //                 value: 'male',
  //               ),
  //               DropdownMenuItem(
  //                 child: Text(
  //                   'Female',
  //                   style: GoogleFonts.aBeeZee(fontSize: 15),
  //                 ),
  //                 value: 'female',
  //               ),
  //             ],
  //             onChanged: (value) {
  //               setState(() {
  //                 _selectedgender = value!;
  //               });
  //             },
  //           ),
  //         ),
  //       ),
  //     ];
}




//  bool completed() {
//     if (_currentstep == 0) {
//       if (email_controller.text.isEmpty) {
//         return false;
//       } else {
//         return true;
//       }
//     } else if (_currentstep == 1) {
//       if (password_controller.text.isEmpty ||
//           confirm_password_controller.text != password_controller.text) {
//         return false;
//       } else {
//         return true;
//       }
//     } else if (_currentstep == 2) {
//       if (name_controller.text.isEmpty) {
//         return false;
//       } else {
//         return true;
//       }
//     } else if (_currentstep == 3) {
//       if (bio_controller.text.isEmpty) {
//         return false;
//       } else {
//         return true;
//       }
//     } else if (_currentstep == 4) {
//       return true;
//     } else if (_currentstep == 5) {
//       return true;
//     }
//     return false;
//   }


// Stepper(
//                         physics: ScrollPhysics(),
//                         elevation: 0,
//                         type: StepperType.horizontal,
//                         onStepTapped: (value) {
//                           _formkey.currentState!.validate();
//                           setState(() {
//                             _currentstep = value;
//                           });
//                         },
//                         currentStep: _currentstep,
//                         onStepContinue: () {
//                           final laststep = _currentstep == getsteps().length - 1;
//                           _formkey.currentState!.validate();
//                           bool valid = completed();
//                           if (valid == true) {
//                             if (laststep) {
//                               setState(() {
//                                 iscompleted = true;
//                               });
                  
//                               showDialog(
//                                   context: context,
//                                   builder: (context) {
//                                     return AlertDialog(
//                                       title: Text('Registration'),
//                                       content: Text(
//                                           'Are you satified with registration information?'),
//                                       actions: [
//                                         newbutton(
//                                           width: 10,
//                                           onpress: () async {
//                                             setState(() {
//                                               Loading = true;
//                                             });
//                                             dynamic result =
//                                                 await Database(uid: currentuseruid)
//                                                     .signupWithEmailandPassword(
//                                                         email: email,
//                                                         password: password);
                  
//                                             if (result != null) {
//                                               print(FirebaseAuth
//                                                   .instance.currentUser?.uid);
//                                               setState(() {
//                                                 Loading = false;
//                                               });
//                                               Database(uid: currentuseruid)
//                                                   .adduserinfo(
//                                                 firstname: name_controller.text,
//                                                 gender: _selectedgender,
//                                                 country: selectedcountry,
//                                                 bio: bio_controller.text,
//                                                 uid: currentuseruid!,
//                                               );
//                                               Navigator.pushReplacementNamed(
//                                                   context, '/home');
                  
//                                               print(result);
//                                             }
//                                           },
//                                           text: Text('Yes, Sign me up'),
//                                         ),
//                                         newbutton(
//                                           onpress: () {},
//                                           text: Text('No, Take me back'),
//                                         ),
//                                       ],
//                                     );
//                                   });
                  
//                               print('passed length');
//                             } else {
//                               setState(() {
//                                 _currentstep++;
//                               });
//                             }
//                           }
//                         },
//                         onStepCancel: () {
//                           if (_currentstep == 0) {
//                             null;
//                           } else {
//                             setState(() {
//                               _currentstep -= 1;
//                             });
//                           }
//                         },
//                         steps: getsteps()
//                         ),