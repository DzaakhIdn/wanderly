import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:wanderly_app/services/firebase_services.dart';
import '../models/trip.dart';
import '../services/hive_service.dart';

part 'trip_provider.g.dart';

@riverpod
class MyTripNotifier extends _$MyTripNotifier {
  final _services = HiveService();
  final _firebaseService = FirebaseService();

  @override
  List<MyTrip> build() {
    return _services.getMyTrip();
  }

  Future<void> addMyTrip(
    String title,
    String address,
    String category,
    String description,
    String imagePath,
    DateTime dateStart,
    DateTime dateEnd,
    String? userId,
    String? id,
  ) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    // Generate ID jika belum ada
    final tripId = id ?? const Uuid().v4();

    final newMyTrip = MyTrip(
      title: title,
      address: address,
      category: category,
      description: description,
      imagePath: imagePath,
      dateStart: dateStart.toIso8601String(),
      dateEnd: dateEnd.toIso8601String(),
      isDone: false,
      userId: user.uid,
      id: tripId,
    );

    await _services.addMyTrip(newMyTrip);

    await _firebaseService.addTrip({
      "id": tripId,
      "title": newMyTrip.title,
      "imagePath": newMyTrip.imagePath,
      "dateStart": newMyTrip.dateStart,
      "dateEnd": newMyTrip.dateEnd,
    }, user.uid);

    state = _services.getMyTrip();
  }

  Future<void> deleteMyTrip(int index) async {
    final user = FirebaseAuth.instance.currentUser;
    final trip = state[index];

    // Delete dari Hive
    await _services.deleteMytrip(index);

    // Delete dari Firebase jika ada ID dan user
    if (user != null && trip.id != null) {
      await _firebaseService.deleteTrip(user.uid, trip.id!);
    }

    state = _services.getMyTrip();
  }

  Future<void> updateMyTrip(
    int index,
    String title,
    DateTime dateStart,
    DateTime dateEnd,
  ) async {
    final user = FirebaseAuth.instance.currentUser;
    final oldTrip = state[index];

    final updated = MyTrip(
      title: title,
      address: oldTrip.address,
      category: oldTrip.category,
      description: oldTrip.description,
      imagePath: oldTrip.imagePath,
      dateStart: dateStart.toIso8601String(),
      dateEnd: dateEnd.toIso8601String(),
      isDone: oldTrip.isDone,
      userId: oldTrip.userId,
      id: oldTrip.id,
    );

    await _services.updateMyList(index, updated);

    // Update di Firebase jika ada user dan ID
    if (user != null && oldTrip.id != null) {
      await _firebaseService.updateTrip(
        {
          "title": title,
          "dateStart": dateStart.toIso8601String(),
          "dateEnd": dateEnd.toIso8601String(),
        },
        user.uid,
        oldTrip.id!,
      );
    }

    state = _services.getMyTrip();
  }
}
