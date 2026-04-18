import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;



  Future<void> register({
    required String email,
    required String password,
    required String username,
    required String gender,
    required BuildContext context,
  }) async {
    try {
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
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(_getErrorMessage(e.toString()))));
    }
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
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(_getErrorMessage(e.toString()))));
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}

String _getErrorMessage(String error) {
  if (error.contains('Invalid login credentials')) {
    return 'password atau email salah';
  } else if (error.contains('User already registered')) {
    return 'Email udah terdaftar!, coba pake email lain';
  } else if (error.contains('Password should be at least 6 characters')) {
    return 'password harus lebih panjang';
  } else if (error.contains('Unable to validate email address')) {
    return 'tolong masukan email yang bener';
  } else if (error.contains('Network request failed')) {
    return 'Kesalahan jaringan, cek koneksi mu!';
  } else if (error.contains('Email not confirmed')) {
    return 'Please check your email and confirm your account.';
  } else if (error.contains('Failed to create profile')) {
    return 'Akun berhasil dibuat tapi gagal :v';
  } else if (error.contains('duplicate key value')) {
    return 'Akun nya udah ada!';
  } else if (error.contains('violates foreign key constraint')) {
    return 'Database constraint error. Please try again.';
  } else {
    return 'Terjadi kesalahan';
  }
}
