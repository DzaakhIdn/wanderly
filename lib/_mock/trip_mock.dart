import 'package:wanderly_app/theme/icon_sets.dart';

class Trip {
  final num id;
  final String title;
  final String imagePath;
  final String location;
  final String category;
  final String categoryIcon;
  final double rating;
  final int reviews;
  final String price;

  Trip({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.location,
    required this.category,
    required this.categoryIcon,
    required this.rating,
    required this.reviews,
    required this.price,
  });
}

final List<Trip> tripMockData = [
  Trip(
    id: 1,
    title: 'Pantai Indah Kapok',
    location: 'Jakarta',
    imagePath: 'assets/images/beach.jpg',
    category: 'Beach',
    categoryIcon: treeIcon,
    rating: 4.8,
    reviews: 36,
    price: '\$40.0/night',
  ),
  Trip(
    id: 2,
    title: 'Kafe Cozy Seru',
    location: 'Bali',
    imagePath: 'assets/images/cafe.jpg',
    category: 'Restaurant',
    categoryIcon: foodIcon,
    rating: 4.5,
    reviews: 28,
    price: '\$25.0/hour',
  ),
  Trip(
    id: 3,
    title: 'Homestay Nyaman',
    location: 'Sulawesi Timur',
    imagePath: 'assets/images/homestay.jpg',
    category: 'Homestay',
    categoryIcon: homeIcon,
    rating: 4.7,
    reviews: 42,
    price: '\$35.0/night',
  ),
  Trip(
    id: 4,
    title: 'Danau Tenang',
    location: 'Jawa Tenggara',
    imagePath: 'assets/images/lake.jpg',
    category: 'Nature',
    categoryIcon: treeIcon,
    rating: 4.9,
    reviews: 51,
    price: '\$20.0/entry',
  ),
  Trip(
    id: 5,
    title: 'Gunung Megah',
    location: 'Daerah Istimewa',
    imagePath: 'assets/images/mountain.jpg',
    category: 'Mountain',
    categoryIcon: treeIcon,
    rating: 4.6,
    reviews: 38,
    price: '\$15.0/entry',
  ),
];
