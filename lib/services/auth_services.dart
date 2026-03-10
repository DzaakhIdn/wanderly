import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

   Future<void> user() async{
    final User? cr_user = _auth.currentUser;

    
   }

  Future<void> register({
    required String email,
    required String password,
    required String username,
    required String gender,
  }) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final uid = credential.user!.uid;

    final user = UserModel(
      uid: uid,
      email: email,
      username: username,
      gender: gender,
    );

    await _db.collection('users').doc(uid).set(user.toMap());
  }

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (!context.mounted) return;
        Navigator.pushNamedAndRemoveUntil(
          context,
          "home_screen",
          (Route<dynamic> route) => false,
        );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Invalid login credentials')));
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.code)));
      }
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
