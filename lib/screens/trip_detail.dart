import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:wanderly_app/_mock/trip_mock.dart';
import 'package:wanderly_app/theme/app_colors.dart';
import 'package:wanderly_app/theme/icon_sets.dart';

class TripDetailScreen extends StatefulWidget {
  static const routeName = 'trip_detail';
  final int tripId;

  const TripDetailScreen({super.key, required this.tripId});

  @override
  State<TripDetailScreen> createState() => _TripDetailScreenState();
}

class _TripDetailScreenState extends State<TripDetailScreen> {
  late Trip trip;
  bool _isLiked = false;

  @override
  void initState() {
    super.initState();
    trip = tripMockData.firstWhere((t) => t.id == widget.tripId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 403,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(trip.imagePath),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(34),
                  ),
                ),

                Positioned(
                  top: 20,
                  left: 17,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                        color: AppColors.light.primary,
                        borderRadius: BorderRadius.circular(34),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  bottom: 16,
                  right: 16,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isLiked = !_isLiked;
                      });
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withAlpha(30),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: Colors.white.withAlpha(50),
                              width: 1,
                            ),
                          ),
                          width: 70,
                          height: 70,
                          child: Center(
                            child: Iconify(
                              likeIcon,
                              size: 38,
                              color: _isLiked ? Colors.pink : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 23),

            Padding(
              padding: const EdgeInsets.only(left: 17),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      spacing: 5,
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          size: 19,
                          color: AppColors.light.primary,
                        ),
                        Text(
                          trip.location,
                          style: GoogleFonts.quicksand(
                            textStyle: TextStyle(
                              color: AppColors.light.primary,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Text(
                      trip.title,
                      style: GoogleFonts.raleway(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.light.textPrimary,
                          fontSize: 32,
                        ),
                      ),
                    ),

                    SizedBox(height: 16),
                    Text(
                      '"${trip.description}"',
                      style: GoogleFonts.quicksand(
                        textStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    SizedBox(height: 22),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.star_rounded, size: 20, color: Colors.amber),
                        Text(
                          trip.rating.toString(),
                          style: GoogleFonts.quicksand(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 224, 236, 255),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            spacing: 6,
                            children: [
                              trip.category.categoryIcon,
                              Text(
                                trip.category.title,
                                style: GoogleFonts.quicksand(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.light.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.reviews_rounded,
                          size: 18,
                          color: AppColors.light.primary,
                        ),
                        SizedBox(width: 6),
                        Text(
                          trip.reviews.toString(),
                          style: GoogleFonts.quicksand(
                            textStyle: TextStyle(
                              fontSize: 14,
                              color: AppColors.light.textPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
