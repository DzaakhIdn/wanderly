import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wanderly_app/data/repositories/trip_repository.dart';
import 'package:wanderly_app/domain/usecases/trip_usecases.dart';
import 'package:wanderly_app/models/trip.dart';

import 'trip_usecases_test.mocks.dart';

@GenerateMocks([ITripRepository])
void main() {
  late GetTripsUseCase getTripsUseCase;
  late MockITripRepository mockRepository;

  setUp(() {
    mockRepository = MockITripRepository();
    getTripsUseCase = GetTripsUseCase(mockRepository);
  });

  group('GetTripsUseCase', () {
    test('should return list of trips from repository', () {
      // Arrange
      final mockTrips = [
        MyTrip(
          title: 'Bali Trip',
          address: 'Bali, Indonesia',
          category: 'Nature',
          description: 'Beautiful beach',
          imagePath: 'assets/images/bali.jpg',
          dateStart: '2026-04-18T00:00:00.000',
          dateEnd: '2026-04-20T00:00:00.000',
          id: '1',
        ),
      ];

      when(mockRepository.getTrips()).thenReturn(mockTrips);

      // Act
      final result = getTripsUseCase();

      // Assert
      expect(result, mockTrips);
      expect(result.length, 1);
      expect(result[0].title, 'Bali Trip');
      verify(mockRepository.getTrips()).called(1);
    });

    test('should return empty list when no trips exist', () {
      // Arrange
      when(mockRepository.getTrips()).thenReturn([]);

      // Act
      final result = getTripsUseCase();

      // Assert
      expect(result, []);
      expect(result.isEmpty, true);
    });
  });

  group('AddTripUseCase', () {
    test('should call repository.addTrip with correct parameters', () async {
      // Arrange
      final addTripUseCase = AddTripUseCase(mockRepository);
      final trip = MyTrip(
        title: 'Jakarta Trip',
        address: 'Jakarta, Indonesia',
        category: 'Resto',
        description: 'City exploration',
        imagePath: 'assets/images/jakarta.jpg',
        dateStart: '2026-04-25T00:00:00.000',
        dateEnd: '2026-04-27T00:00:00.000',
        id: '2',
      );
      const userId = 'user123';

      when(mockRepository.addTrip(trip, userId)).thenAnswer((_) async => {});

      // Act
      await addTripUseCase(trip, userId);

      // Assert
      verify(mockRepository.addTrip(trip, userId)).called(1);
    });
  });

  group('DeleteTripUseCase', () {
    test('should call repository.deleteTrip with correct parameters', () async {
      // Arrange
      final deleteTripUseCase = DeleteTripUseCase(mockRepository);
      const index = 0;
      const userId = 'user123';
      const tripId = 'trip123';

      when(
        mockRepository.deleteTrip(index, userId, tripId),
      ).thenAnswer((_) async => {});

      // Act
      await deleteTripUseCase(index, userId, tripId);

      // Assert
      verify(mockRepository.deleteTrip(index, userId, tripId)).called(1);
    });
  });
}
