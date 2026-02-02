class Trip {
  final String title;
  final String imagePath;
  final double rating;

  Trip({required this.title, required this.imagePath, required this.rating});
}

final List<Trip> tripMockData = [
  Trip(
    title: 'Pantai Indah',
    imagePath: 'assets/images/beach.jpg',
    rating: 4.8,
  ),
  Trip(title: 'Kafe Cozy', imagePath: 'assets/images/cafe.jpg', rating: 4.5),
  Trip(
    title: 'Homestay Nyaman',
    imagePath: 'assets/images/homestay.jpg',
    rating: 4.7,
  ),
  Trip(title: 'Danau Tenang', imagePath: 'assets/images/lake.jpg', rating: 4.9),
  Trip(
    title: 'Gunung Megah',
    imagePath: 'assets/images/mountain.jpg',
    rating: 4.6,
  ),
];
