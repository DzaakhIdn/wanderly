import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wanderly_app/_mock/mytrips.dart';
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
    String imagePath,
    DateTime dateStart,
    DateTime dateEnd,
  ) async {
    final newMyTrip = MyTrip(
      title: title,
      address: address,
      category: category,
      imagePath: imagePath,
      dateStart: dateStart,
      dateEnd: dateEnd,
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
      imagePath: oldTrip.imagePath,
      dateStart: dateStart,
      dateEnd: dateEnd,
      isDone: oldTrip.isDone,
    );

    await _services.updateMyList(index, updated);
    state = _services.getMyTrip();
  }
}
