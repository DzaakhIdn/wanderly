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
    title: "Nature",
    categoryIcon: Iconify(foodIcon, size: 14, color: AppColors.light.secondary),
  );
  static var homestay = TripCategory(
    title: "Nature",
    categoryIcon: Iconify(homeStay, size: 14, color: AppColors.light.secondary),
  );
  static var hotel = TripCategory(
    title: "Nature",
    categoryIcon: Iconify(
      hotelIcon,
      size: 14,
      color: AppColors.light.secondary,
    ),
  );
}

List<Mytrips> trips = [
  Mytrips(
    id: 1,
    title: "Pergi ke Pantai",
    imagePath:
        "https://images.unsplash.com/photo-1473116763249-2faaef81ccda?q=80&w=1196&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    category: TripCategory.nature.title,
    categoryIcon: TripCategory.nature.categoryIcon,
    address: "Jakarta, Indognesia",
    dateStart: "12 Feb 28",
    dateEnd: "23 Feb 29",
  ),
  Mytrips(
    id: 2,
    title: "Hotel Keren Banget",
    imagePath:
        "https://images.unsplash.com/photo-1611892440504-42a792e24d32?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    category: TripCategory.hotel.title,
    categoryIcon: TripCategory.hotel.categoryIcon,
    address: "Bali, Indognesia Timur",
    dateStart: "12 Jan 28",
    dateEnd: "23 May 29",
  ),
  Mytrips(
    id: 2,
    title: "Telor Rebus Premium",
    imagePath:
        "https://images.unsplash.com/photo-1482049016688-2d3e1b311543?q=80&w=710&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    category: TripCategory.resto.title,
    categoryIcon: TripCategory.resto.categoryIcon,
    address: "Sulawesi Timur, Jawa Barat",
    dateStart: "12 Jun 28",
    dateEnd: "23 Jan 29",
  ),
  Mytrips(
    id: 3,
    title: "Homestay nyaman",
    imagePath:
        "https://images.unsplash.com/photo-1566571807426-61eca847576f?q=80&w=1074&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    category: TripCategory.homestay.title,
    categoryIcon: TripCategory.homestay.categoryIcon,
    address: "Jakarta, Indognesia",
    dateStart: "12 Feb 28",
    dateEnd: "23 Feb 29",
  ),
  Mytrips(
    id: 4,
    title: "Hutan ambalabu",
    imagePath:
        "https://images.unsplash.com/photo-1513836279014-a89f7a76ae86?q=80&w=688&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    category: TripCategory.nature.title,
    categoryIcon: TripCategory.nature.categoryIcon,
    address: "Rongawi, Ngawi Selatan",
    dateStart: "12 Feb 28",
    dateEnd: "23 Feb 29",
  ),
];

List<Mytrips> tripsPassed = [
  Mytrips(
    id: 1,
    title: "Pergi ke Pantai",
    imagePath:
        "https://images.unsplash.com/photo-1505142468610-359e7d316be0?q=80&w=626&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    category: TripCategory.nature.title,
    categoryIcon: TripCategory.nature.categoryIcon,
    address: "Jakarta, Indognesia",
    dateStart: "12 Feb 28",
    dateEnd: "23 Feb 29",
  ),
  Mytrips(
    id: 2,
    title: "Hotel Keren Banget",
    imagePath:
        "https://images.unsplash.com/photo-1611892440504-42a792e24d32?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    category: TripCategory.hotel.title,
    categoryIcon: TripCategory.hotel.categoryIcon,
    address: "Bali, Indognesia Timur",
    dateStart: "12 Jan 28",
    dateEnd: "23 May 29",
  ),
  Mytrips(
    id: 2,
    title: "Telor Rebus Premium",
    imagePath:
        "https://images.unsplash.com/photo-1482049016688-2d3e1b311543?q=80&w=710&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    category: TripCategory.resto.title,
    categoryIcon: TripCategory.resto.categoryIcon,
    address: "Sulawesi Timur, Jawa Barat",
    dateStart: "12 Jun 28",
    dateEnd: "23 Jan 29",
  ),
  Mytrips(
    id: 3,
    title: "Homestay nyaman",
    imagePath:
        "https://images.unsplash.com/photo-1566571807426-61eca847576f?q=80&w=1074&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    category: TripCategory.homestay.title,
    categoryIcon: TripCategory.homestay.categoryIcon,
    address: "Jakarta, Indognesia",
    dateStart: "12 Feb 28",
    dateEnd: "23 Feb 29",
  ),
  Mytrips(
    id: 4,
    title: "Gunung Amba",
    imagePath:
        "https://images.unsplash.com/photo-1426604966848-d7adac402bff?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    category: TripCategory.nature.title,
    categoryIcon: TripCategory.nature.categoryIcon,
    address: "Rongawi, Ngawi Selatan",
    dateStart: "12 Feb 28",
    dateEnd: "23 Feb 29",
  ),
];
