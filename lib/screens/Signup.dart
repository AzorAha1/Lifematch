import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifematch/Database/auth.dart';
import 'package:lifematch/constants.dart';
import 'package:lifematch/screens/mainpage.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:country_pickers/countries.dart';
import 'package:country_pickers/country_pickers.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final allcount = [
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

  String selectedcountry = '*Choose a Country*';
  String email = '';
  String password = '';
  String error = '';
  bool iscompleted = false;
  bool Loading = false;

  String _selectedgender = 'empty';
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  final age_controller = TextEditingController();
  final name_controller = TextEditingController();

  TextEditingController gender_controller = TextEditingController();
  final confirm_password_controller = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  int _currentstep = 0;

  Future adduserinfo({
    required String firstname,
    required String gender,
    required String country,
  }) async {
    await FirebaseFirestore.instance.collection('users').add({
      'firstname': firstname,
      'gender': gender,
      'country': country,
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: Loading,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      child: Icon(Icons.arrow_back_ios),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      width: 130,
                    ),
                    Text(
                      'Registration',
                      style: GoogleFonts.aBeeZee(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Form(
                key: _formkey,
                child: Theme(
                  data: ThemeData(
                      accentColor: Colors.red, primarySwatch: Colors.red),
                  child: Stepper(
                    type: StepperType.vertical,
                    onStepTapped: (value) {
                      _formkey.currentState!.validate();
                      setState(() {
                        _currentstep = value;
                      });
                    },
                    currentStep: _currentstep,
                    onStepContinue: () {
                      final laststep = _currentstep == getsteps().length - 1;
                      _formkey.currentState!.validate();
                      bool valid = completed();
                      if (valid == true) {
                        if (laststep) {
                          setState(() {
                            iscompleted = true;
                          });
    
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Registration'),
                                  content: Text(
                                      'Are you satified with registration information?'),
                                  actions: [
                                    newbutton(
                                      width: 10,
                                      onpress: () async {
                                        setState(() {
                                          Loading = true;
                                        });
                                        dynamic result = await Database()
                                            .signupWithEmailandPassword(
                                                email: email,
                                                password: password);
    
                                        if (result != null) {
                                          setState(() {
                                            Loading = false;
                                          });
                                          Navigator.pushReplacementNamed(
                                              context, '/home');
                                          print(result);
                                          setState(() {
                                            adduserinfo(
                                                firstname: name_controller.text,
                                                gender: _selectedgender,
                                                country: selectedcountry);
                                          });
                                        }
                                      },
                                      text: Text('Yes, Sign me up'),
                                    ),
                                    newbutton(
                                      onpress: () {},
                                      text: Text('No, Take me back'),
                                    ),
                                  ],
                                );
                              });
    
                          print('passed length');
                        } else {
                          setState(() {
                            _currentstep++;
                          });
                        }
                      }
                    },
                    onStepCancel: () {
                      if (_currentstep == 0) {
                        null;
                      } else {
                        setState(() {
                          _currentstep -= 1;
                        });
                      }
                    },
                    steps: getsteps(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool completed() {
    if (_currentstep == 0) {
      if (email_controller.text.isEmpty) {
        return false;
      } else {
        return true;
      }
    } else if (_currentstep == 1) {
      if (password_controller.text.isEmpty ||
          confirm_password_controller.text != password_controller.text) {
        return false;
      } else {
        return true;
      }
    } else if (name_controller.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  List<Step> getsteps() => [
        Step(
          isActive: _currentstep >= 0,
          title: Text('Email'),
          content: TextFormField(
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
                hintStyle: GoogleFonts.aBeeZee()),
          ),
        ),
        Step(
          isActive: _currentstep >= 1,
          title: Text('Password'),
          content: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value!.length < 6) {
                    return 'Password needs to be 6+ chars';
                  }
                },
                obscureText: true,
                controller: password_controller,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                decoration: ktextformfield.copyWith(
                    hintText: 'Password', hintStyle: GoogleFonts.aBeeZee()),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value != password_controller.text) {
                    return "Doesn't Match Password";
                  }
                },
                obscureText: true,
                controller: confirm_password_controller,
                decoration: ktextformfield.copyWith(
                    hintText: 'Confirm Password',
                    hintStyle: GoogleFonts.aBeeZee()),
              ),
            ],
          ),
        ),
        Step(
          isActive: _currentstep >= 3,
          title: Text('What do you want to be called ?'),
          content: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Empty field';
              }
            },
            controller: name_controller,
            decoration: ktextformfield.copyWith(
                hintText: 'Name', hintStyle: GoogleFonts.aBeeZee()),
          ),
        ),
        Step(
            title: Text('Location'),
            content: DropdownButton(
              value: selectedcountry,
              onChanged: (value) {
                setState(() {
                  selectedcountry = value!;
                });
              },
              items: allcount.map((e) {
                return DropdownMenuItem(
                  child: Text(e),
                  value: e,
                );
              }).toList(),
            )),
        Step(
          title: Text('Sex'),
          content: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButton<String>(
              value: _selectedgender,
              items: [
                DropdownMenuItem(
                  child: Text(
                    '*Empty*',
                    style: GoogleFonts.aBeeZee(fontSize: 15),
                  ),
                  value: 'empty',
                ),
                DropdownMenuItem(
                  child: Text(
                    'Male',
                    style: GoogleFonts.aBeeZee(fontSize: 15),
                  ),
                  value: 'male',
                ),
                DropdownMenuItem(
                  child: Text(
                    'Female',
                    style: GoogleFonts.aBeeZee(fontSize: 15),
                  ),
                  value: 'female',
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedgender = value!;
                });
              },
            ),
          ),
        )
      ];
}
