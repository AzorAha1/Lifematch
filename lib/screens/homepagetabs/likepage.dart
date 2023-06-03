import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<List<DocumentSnapshot>> getUsers() async {
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('users').get();
  return querySnapshot.docs;
}

class Likepage extends StatefulWidget {
  const Likepage({Key? key}) : super(key: key);

  @override
  State<Likepage> createState() => _LikepageState();
}

class _LikepageState extends State<Likepage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('No Likes Yet'),
      )
      
    );
  }
}
