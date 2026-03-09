import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/trip.dart';
import '../services/hive_service.dart';

part 'trip_provider.g.dart';

@riverpod
class MyTripNotifier extends _$MyTripNotifier {
  final _services = HiveService();

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
  ) async {
    final newMyTrip = MyTrip(
      title: title,
      address: address,
      category: category,
      description: description,
      imagePath: imagePath,
      dateStart: dateStart.toIso8601String(),
      dateEnd: dateEnd.toIso8601String(),
      isDone: false,
    );

    await _services.addMyTrip(newMyTrip);
    state = _services.getMyTrip();
  }

  Future<void> deleteMyTrip(int index) async {
    await _services.deleteMytrip(index);
    state = _services.getMyTrip();
  }

  Future<void> updateMyTrip(
    int index,
    String title,
    DateTime dateStart,
    DateTime dateEnd,
  ) async {
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
    );

    await _services.updateMyList(index, updated);
    state = _services.getMyTrip();
  }
}
