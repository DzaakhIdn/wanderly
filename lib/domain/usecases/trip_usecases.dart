import 'package:wanderly_app/data/repositories/trip_repository.dart';
import 'package:wanderly_app/models/trip.dart';

class AddTripUseCase {
  final ITripRepository repository;

  AddTripUseCase(this.repository);

  Future<void> call(MyTrip trip, String userId) {
    return repository.addTrip(trip, userId);
  }
}

class UpdateTripUseCase {
  final ITripRepository repository;

  UpdateTripUseCase(this.repository);

  Future<void> call(int index, MyTrip trip, String userId) {
    return repository.updateTrip(index, trip, userId);
  }
}

class DeleteTripUseCase {
  final ITripRepository repository;

  DeleteTripUseCase(this.repository);

  Future<void> call(int index, String userId, String tripId) {
    return repository.deleteTrip(index, userId, tripId);
  }
}

class GetTripsUseCase {
  final ITripRepository repository;

  GetTripsUseCase(this.repository);

  List<MyTrip> call() {
    return repository.getTrips();
  }
}
