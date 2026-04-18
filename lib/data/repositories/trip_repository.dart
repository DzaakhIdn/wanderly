import 'package:wanderly_app/core/exceptions/app_exceptions.dart';
import 'package:wanderly_app/models/trip.dart';
import 'package:wanderly_app/services/firebase_services.dart';
import 'package:wanderly_app/services/hive_service.dart';

abstract class ITripRepository {
  Future<void> addTrip(MyTrip trip, String userId);
  Future<void> updateTrip(int index, MyTrip trip, String userId);
  Future<void> deleteTrip(int index, String userId, String tripId);
  List<MyTrip> getTrips();
}

class TripRepository implements ITripRepository {
  final HiveService _hiveService;
  final FirebaseService _firebaseService;

  TripRepository({
    required HiveService hiveService,
    required FirebaseService firebaseService,
  }) : _hiveService = hiveService,
       _firebaseService = firebaseService;

  @override
  Future<void> addTrip(MyTrip trip, String userId) async {
    try {
      await _hiveService.addMyTrip(trip);
      await _firebaseService.addTrip({
        "id": trip.id,
        "title": trip.title,
        "imagePath": trip.imagePath,
        "dateStart": trip.dateStart,
        "dateEnd": trip.dateEnd,
      }, userId);
    } catch (e) {
      throw HiveException(message: 'Failed to add trip: $e');
    }
  }

  @override
  Future<void> updateTrip(int index, MyTrip trip, String userId) async {
    try {
      await _hiveService.updateMyList(index, trip);
      if (trip.id != null) {
        await _firebaseService.updateTrip(
          {
            "title": trip.title,
            "dateStart": trip.dateStart,
            "dateEnd": trip.dateEnd,
          },
          userId,
          trip.id!,
        );
      }
    } catch (e) {
      throw HiveException(message: 'Failed to update trip: $e');
    }
  }

  @override
  Future<void> deleteTrip(int index, String userId, String tripId) async {
    try {
      await _hiveService.deleteMytrip(index);
      await _firebaseService.deleteTrip(userId, tripId);
    } catch (e) {
      throw HiveException(message: 'Failed to delete trip: $e');
    }
  }

  @override
  List<MyTrip> getTrips() {
    try {
      return _hiveService.getMyTrip();
    } catch (e) {
      throw HiveException(message: 'Failed to get trips: $e');
    }
  }
}
