import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

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
  String description;

  @HiveField(5)
  String dateStart;

  @HiveField(6)
  String dateEnd;

  @HiveField(7)
  bool? isDone;

  MyTrip({
    required this.title,
    required this.address,
    required this.category,
    required this.description,
    required this.imagePath,
    required this.dateStart,
    required this.dateEnd,
    this.isDone,
  });

  DateTime get dateStartAsDateTime => DateTime.parse(dateStart);
  DateTime get dateEndAsDateTime => DateTime.parse(dateEnd);

  Widget get categoryIcon {
    switch (category.toLowerCase()) {
      case 'nature':
        return Icon(Icons.nature, size: 16, color: Colors.green);
      case 'resto':
        return Icon(Icons.restaurant, size: 16, color: Colors.orange);
      case 'homestay':
        return Icon(Icons.home, size: 16, color: Colors.blue);
      case 'hotel':
        return Icon(Icons.hotel, size: 16, color: Colors.purple);
      default:
        return Icon(Icons.place, size: 16, color: Colors.grey);
    }
  }
}
