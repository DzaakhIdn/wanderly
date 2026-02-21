import 'package:hive/hive.dart';
import '../models/trip.dart';

class HiveService {
  static const String _boxName = "myTrips";

  Box<MyTrip> get _box => Hive.box<MyTrip>(_boxName);

  List<MyTrip> getMyTrip() {
    return _box.values.toList();
  }

  Future<void> addMyTrip(MyTrip trip) async {
    await _box.add(trip);
  }

  Future<void> deleteMytrip(int index) async {
    await _box.delete(index);
  }

  Future<void> updateMyList(int index, MyTrip trip) async {
    await _box.putAt(index, trip);
  }
}
