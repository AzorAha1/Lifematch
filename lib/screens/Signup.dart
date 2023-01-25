import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifematch/Database/auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../constants.dart';
import 'Signin.dart';
import 'mainpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String email = '';
  String password = '';
  String error = '';
  final _auth = Database();
  String _selectedgender = 'male';
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  final age_controller = TextEditingController();
  final firstname_controller = TextEditingController();
  final lastname_controller = TextEditingController();
  TextEditingController gender_controller = TextEditingController();
  final confirm_password_controller = TextEditingController();
  User? user;
  final _formkey = GlobalKey<FormState>();
  @override
  Future adduserinfo(
      {required String firstname,
      required String lastname,
      required String age,
      required String gender}) async {
    await FirebaseFirestore.instance.collection('users').add({
      'firstname': firstname,
      'lastname': lastname,
      'age': age,
      'gender': gender,
    });
  }

  bool Loading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: Loading,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 20),
                child: Row(
                  children: [
                    InkWell(
                        child: Icon(Icons.arrow_back_ios),
                        onTap: () {
                          Navigator.pop(context);
                        }),
                    SizedBox(
                      width: 130,
                    ),
                    Text(
                      'Sign Up',
                      style: GoogleFonts.aBeeZee(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      error,
                      style: GoogleFonts.aBeeZee(color: Colors.orange),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
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
                            hintStyle: GoogleFonts.aBeeZee()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
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
                            hintText: 'Password',
                            hintStyle: GoogleFonts.aBeeZee()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
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
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Empty Field';
                          }
                        },
                        controller: firstname_controller,
                        decoration: ktextformfield.copyWith(
                            hintText: 'First Name',
                            hintStyle: GoogleFonts.aBeeZee()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Empty field';
                          }
                        },
                        controller: lastname_controller,
                        decoration: ktextformfield.copyWith(
                            hintText: 'Last Name',
                            hintStyle: GoogleFonts.aBeeZee()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        controller: age_controller,
                        decoration: ktextformfield.copyWith(
                            hintText: 'Age', hintStyle: GoogleFonts.aBeeZee()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Text(
                            'Sex: ',
                            style: GoogleFonts.aBeeZee(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          DropdownButton<String>(
                            value: _selectedgender,
                            items: [
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
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 150),
                      child: newbutton( 
                        onpress: (() async {
                          print(email);
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              Loading = true;
                            });
                            dynamic result =
                                await _auth.signupWithEmailandPassword(
                                    email: email, password: password);
                            // password_controller.clear();
                            // confirm_password_controller.clear();
                            // email_controller.clear();
                            // age_controller.clear();
                            // firstname_controller.clear();
                            // lastname_controller.clear();

                            if (result != null) {
                              adduserinfo(
                                age: age_controller.text,
                                lastname: lastname_controller.text,
                                firstname: firstname_controller.text,
                                gender: _selectedgender,
                              );
                              setState(() {
                                Navigator.pushReplacementNamed(
                                    context, '/home');
                                Loading = false;
                              });
                            } else if (result == null) {
                              setState(() {
                                Loading = false;
                                error = 'Format E-mail or Password Properly';
                              });
                            }
                          }
                        }),
                        text: Text('Register'),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            indent: 20,
                            endIndent: 20,
                            thickness: 1,
                          ),
                        ),
                        Text(
                          'Or Continue with',
                          style: GoogleFonts.aBeeZee(
                              color: Color.fromARGB(221, 193, 181, 181)),
                        ),
                        Expanded(
                          child: Divider(
                            indent: 20,
                            endIndent: 20,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        imagecontain(
                          imagepath: 'images/googleimage.png',
                          onpress: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: GoogleFonts.aBeeZee(),
                  ),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, '/signin'),
                    child: Text(
                      'Log in ',
                      style: GoogleFonts.aBeeZee(color: Colors.red),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
