import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifematch/Database/auth.dart';
import '../constants.dart';
import 'Signin.dart';
import 'mainpage.dart';

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
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  final age_controller = TextEditingController();
  final firstname_controller = TextEditingController();
  final lastname_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            SizedBox(
              height: 30,
            ),
            Form(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: email_controller,
                      onChanged: (value) => email = value,
                      decoration: ktextformfield.copyWith(
                          hintText: 'Username or Email',
                          hintStyle: GoogleFonts.aBeeZee()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: password_controller,
                      onChanged: (value) => password = value,
                      decoration: ktextformfield.copyWith(
                          hintText: 'Password',
                          hintStyle: GoogleFonts.aBeeZee()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: password_controller,
                      onChanged: (value) => email = value,
                      decoration: ktextformfield.copyWith(
                          hintText: 'Confirm Password',
                          hintStyle: GoogleFonts.aBeeZee()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: firstname_controller,

                      decoration: ktextformfield.copyWith(
                          hintText: 'First Name',
                          hintStyle: GoogleFonts.aBeeZee()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
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
                    child: TextFormField(
                      //controller: email_controller,

                      decoration: ktextformfield.copyWith(
                          hintText: '', hintStyle: GoogleFonts.aBeeZee()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 150),
                    child: newbutton(
                      onpress: (() async {
                        password_controller.clear();
                        email_controller.clear();
                        dynamic result = await _auth.signupWithEmailandPassword(
                            email: email, password: password);
                        if (result != null) {
                          setState(() {
                            Navigator.pushReplacementNamed(context, '/home');
                          });
                        } else {
                          setState(() {
                            error = 'Format E-mail or Password Properly';
                          });
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
                      SizedBox(
                        width: 30,
                      ),
                      imagecontain(
                        imagepath: 'images/anonymous.png',
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
            Text(
              error,
              style: GoogleFonts.aBeeZee(color: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}
