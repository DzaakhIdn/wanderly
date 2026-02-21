import 'package:hive/hive.dart';
import 'package:wanderly_app/_mock/mytrips.dart';

part 'trip.g.dart';

@HiveType(typeId: 0)
class MyTrip extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String address;

  @HiveField(2)
  String imagePath;

  @HiveField(3)
  String category;

  @HiveField(4)
  DateTime dateStart;

  @HiveField(5)
  DateTime dateEnd;

  @HiveField(6)
  bool? isDone;

  MyTrip({
    required this.title,
    required this.address,
    required this.category,
    required this.imagePath,
    required this.dateStart,
    required this.dateEnd,
    this.isDone,
  });
}
