import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wanderly_app/_mock/trip_mock.dart';
import 'package:wanderly_app/theme/app_colors.dart';

class TripDetailScreen extends StatefulWidget {
  static const routeName = 'trip_detail';
  final int tripId;

  const TripDetailScreen({super.key, required this.tripId});

  @override
  State<TripDetailScreen> createState() => _TripDetailScreenState();
}

class _TripDetailScreenState extends State<TripDetailScreen> {
  late Trip trip;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    trip = tripMockData.firstWhere((t) => t.id == widget.tripId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
