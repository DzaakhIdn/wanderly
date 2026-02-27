import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:wanderly_app/theme/app_colors.dart';
import 'package:wanderly_app/theme/icon_sets.dart';

class Mytrips {
  final num id;
  String title;
  final String imagePath;
  final String category;
  final Widget categoryIcon;
  String address;
  final String dateStart;
  final String dateEnd;

  Mytrips({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.category,
    required this.categoryIcon,
    required this.address,
    required this.dateStart,
    required this.dateEnd,
  });

  Mytrips copyWith({
    num? id,
    String? title,
    String? imagePath,
    String? category,
    Widget? categoryIcon,
    String? address,
    String? dateStart,
    String? dateEnd,
  }) {
    return Mytrips(
      id: id ?? this.id,
      title: title ?? this.title,
      imagePath: imagePath ?? this.imagePath,
      category: category ?? this.category,
      categoryIcon: categoryIcon ?? this.categoryIcon,
      address: address ?? this.address,
      dateStart: dateStart ?? this.dateStart,
      dateEnd: dateEnd ?? this.dateEnd,
    );
  }
}

class TripCategory {
  final String title;
  final Widget categoryIcon;

  TripCategory({required this.title, required this.categoryIcon});

  static var nature = TripCategory(
    title: "Nature",
    categoryIcon: Iconify(treeIcon, size: 14, color: AppColors.light.secondary),
  );
  static var resto = TripCategory(
    title: "Resto",
    categoryIcon: Iconify(foodIcon, size: 14, color: AppColors.light.secondary),
  );
  static var homestay = TripCategory(
    title: "Homestay",
    categoryIcon: Iconify(homeStay, size: 14, color: AppColors.light.secondary),
  );
  static var hotel = TripCategory(
    title: "Hotel",
    categoryIcon: Iconify(
      hotelIcon,
      size: 14,
      color: AppColors.light.secondary,
    ),
  );
}
