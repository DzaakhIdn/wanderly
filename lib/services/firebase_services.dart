import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class FirebaseService {
  final _db = FirebaseFirestore.instance;

  Future<void> addTrip(Map<String, dynamic> data, String userId) async {
    // Generate ID jika belum ada
    final tripId = data['id'] ?? const Uuid().v4();
    data['id'] = tripId;

    await _db
        .collection('users')
        .doc(userId)
        .collection('TODOS')
        .doc(tripId)
        .set(data);
  }

  Future<List<Map<String, dynamic>>> getTodos(String userId) async {
    final snapshot = await _db
        .collection('users')
        .doc(userId)
        .collection('TODOS')
        .get();

    return snapshot.docs.map((e) => e.data()).toList();
  }

  Future<void> deleteTrip(String userId, String tripId) async {
    await _db
        .collection('users')
        .doc(userId)
        .collection('TODOS')
        .doc(tripId)
        .delete();
  }

  Future<void> updateTrip(
    Map<String, dynamic> data,
    String userId,
    String tripId,
  ) async {
    await _db
        .collection('users')
        .doc(userId)
        .collection('TODOS')
        .doc(tripId)
        .update(data);
  }
}
