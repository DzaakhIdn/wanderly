import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wanderly_app/_mock/trip_mock.dart';
import 'package:wanderly_app/theme/app_colors.dart';
import 'package:wanderly_app/widgets/trip_card.dart';
import 'package:wanderly_app/screens/trip_detail.dart';

class DiscoverAllTripsScreen extends StatelessWidget {
  static const routeName = 'discover_all_trips';

  const DiscoverAllTripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light.background,
      appBar: AppBar(
        backgroundColor: AppColors.light.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'All Trips',
          style: GoogleFonts.quicksand(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            spacing: 10,
            children: tripMockData
                .map(
                  (trip) => TripCard(
                    imagePath: trip.imagePath,
                    title: trip.title,
                    location: trip.location,
                    category: trip.category.title,
                    categoryIcon: trip.category.categoryIcon,
                    rating: trip.rating,
                    reviews: trip.reviews,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        TripDetailScreen.routeName,
                        arguments: trip.id,
                      );
                    },
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
