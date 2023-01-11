import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googlesignin = GoogleSignIn();

final _auth = FirebaseAuth.instance;

class Database {
  Future signinAnon() async {
    dynamic user = await _auth.signInAnonymously();
    return user;
  }
}
