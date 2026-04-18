import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../services/auth_services.dart';
import '../models/user.dart';

part 'auth_provider.g.dart';

@riverpod
AuthServices authService(AuthServiceRef ref) {
  return AuthServices();
}

@riverpod
Stream<User?> authState(AuthStateRef ref) {
  return FirebaseAuth.instance.authStateChanges();
}

@riverpod
Stream<UserModel?> currentUserStream(CurrentUserStreamRef ref) {
  final user = FirebaseAuth.instance.currentUser;

  if (user == null) return Stream.value(null);

  return FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .snapshots()
      .map((doc) {
        if (!doc.exists) return null;

        final data = doc.data()!;

        return UserModel(
          uid: user.uid,
          email: data['email'],
          username: data['username'],
          gender: data['gender'],
        );
      });
}
