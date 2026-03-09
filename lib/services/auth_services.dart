import 'package:firebase_auth/firebase_auth.dart';
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
    required String password
  })  async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
