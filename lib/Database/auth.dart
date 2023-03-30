import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googlesignin = GoogleSignIn(scopes: ['email']);

final _auth = FirebaseAuth.instance;
final currentuid = FirebaseAuth.instance.currentUser?.uid;

class Database {
  String? uid;
  Database({this.uid});
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

  Future adduserinfo({
    String? firstname,
    String? gender,
    String? country,
    String? bio,
    String? uid,
    String? dateofbirth,
    String? preference,
    List? hobbies,
    String? minimumage,
    String? maximumage,
    File? img1,
    File? img2,
    File? img3,
    File? img4,
    File? img5,
    File? img6,
  }) async {
    final DocumentReference documentReference =
        FirebaseFirestore.instance.collection('users').doc(currentuid);
    await documentReference.set({
      'firstname': firstname,
      'gender': gender,
      'country': country,
      'bio': bio,
      'uid': currentuid,
      'date of birth': dateofbirth,
      'preference': preference,
      'hobbies': hobbies,
      'The min age you would date is ': minimumage,
      'The max age you would date is ': maximumage,
      'image 1': img1?.path,
      'image 2': img2?.path,
      'image 3': img3?.path,
      'image 4': img4?.path,
      'image 5': img5?.path,
      'image 6': img6?.path,
    });
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

  Stream<QuerySnapshot<Map<String, dynamic>>> newbuilder() {
    return FirebaseFirestore.instance.collection('users').snapshots();
  }
}
