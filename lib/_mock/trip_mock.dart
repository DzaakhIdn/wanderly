import 'package:wanderly_app/_mock/mytrips.dart';

class Trip {
  final num id;
  final String title;
  final String imagePath;
  final String location;
  final TripCategory category;
  final TripCategory? categoryIcon;
  final double rating;
  final int reviews;
  final String price;
  final String description;

  Trip({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.location,
    required this.category,
    this.categoryIcon,
    required this.rating,
    required this.reviews,
    required this.price,
    required this.description,
  });
}

final List<Trip> tripMockData = [
  Trip(
    id: 1,
    title: 'Pantai Indah Kapok',
    location: 'Jakarta',
    imagePath: '',
    category: TripCategory.nature,
    rating: 4.8,
    reviews: 36,
    price: '\$40.0/night',
    description:
        'Pantai yang indah dengan pasir putih dan ombak yang sempurna untuk berenang. Cocok untuk liburan keluarga dengan fasilitas lengkap.',
  ),
  Trip(
    id: 2,
    title: 'Kafe Cozy Seru',
    location: 'Bali',
    imagePath: '',
    category: TripCategory.resto,
    rating: 4.5,
    reviews: 28,
    price: '\$25.0/hour',
    description:
        'Kafe dengan suasana nyaman dan menu makanan lezat. Tempat yang sempurna untuk bersantai dan menikmati kopi berkualitas.',
  ),
  Trip(
    id: 3,
    title: 'Homestay Nyaman',
    location: 'Sulawesi Timur',
    imagePath: '',
    category: TripCategory.homestay,
    rating: 4.7,
    reviews: 42,
    price: '\$35.0/night',
    description:
        'Homestay yang nyaman dengan pelayanan ramah. Dilengkapi dengan fasilitas modern dan lokasi strategis dekat dengan pusat kota.',
  ),
  Trip(
    id: 4,
    title: 'Danau Tenang',
    location: 'Jawa Tenggara',
    imagePath: '',
    category: TripCategory.nature,
    rating: 4.9,
    reviews: 51,
    price: '\$20.0/entry',
    description:
        'Danau yang tenang dengan pemandangan alam yang menakjubkan. Ideal untuk fotografi, piknik, dan menikmati keindahan alam.',
  ),
  Trip(
    id: 5,
    title: 'Gunung Megah',
    location: 'Daerah Istimewa',
    imagePath: '',
    category: TripCategory.nature,
    rating: 4.6,
    reviews: 38,
    price: '\$15.0/entry',
    description:
        'Gunung dengan pemandangan spektakuler dari puncaknya. Cocok untuk pendakian dan menikmati sunrise yang indah.',
  ),
  Trip(
    id: 6,
    title: 'Resort Mewah Tepi Pantai',
    location: 'Lombok',
    imagePath: '',
    category: TripCategory.hotel,
    rating: 4.9,
    reviews: 67,
    price: '\$85.0/night',
    description:
        'Resort bintang lima dengan fasilitas lengkap dan pemandangan pantai yang menawan. Menawarkan pengalaman liburan mewah yang tak terlupakan.',
  ),
  Trip(
    id: 7,
    title: 'Taman Nasional Komodo',
    location: 'Nusa Tenggara Timur',
    imagePath: '',
    category: TripCategory.nature,
    rating: 4.8,
    reviews: 55,
    price: '\$30.0/entry',
    description:
        'Taman nasional yang terkenal dengan komodo raksasa. Destinasi wisata alam yang wajib dikunjungi untuk petualangan seru.',
  ),
  Trip(
    id: 8,
    title: 'Restoran Seafood Premium',
    location: 'Surabaya',
    imagePath: '',
    category: TripCategory.resto,
    rating: 4.7,
    reviews: 44,
    price: '\$45.0/person',
    description:
        'Restoran seafood dengan menu pilihan terbaik dan chef berpengalaman. Suasana elegan cocok untuk acara spesial.',
  ),
];
