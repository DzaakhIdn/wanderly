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
