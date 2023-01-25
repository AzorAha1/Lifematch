import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googlesignin = GoogleSignIn(scopes: ['email']);

final _auth = FirebaseAuth.instance;
//final currentuser = Fire

class Database {
  Future signinAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      final user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signinWithEmailandPassword(
      {required String email, required String password}) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signupWithEmailandPassword(
      {required String email, required String password}) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future Signinwithgoogle() async {
    GoogleSignInAccount? user = await _googlesignin.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await user!.authentication;
    AuthCredential authProvider = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    return await _auth.signInWithCredential(authProvider);
  }
}
