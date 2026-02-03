import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:wanderly_app/theme/app_colors.dart';
import 'package:wanderly_app/theme/icon_sets.dart';
import 'package:wanderly_app/widgets/navbar/navbar.dart';
import 'package:wanderly_app/widgets/navbar/navbar_item.dart';

class SavedTripScreen extends StatefulWidget {
  static const routName = 'saved_trip';
  const SavedTripScreen({super.key});

  @override
  State<SavedTripScreen> createState() => _SavedTripScreenState();
}

class _SavedTripScreenState extends State<SavedTripScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light.background,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 41,
                    height: 41,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2F4BB9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "My Trips",
                      style: GoogleFonts.quicksand(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF222222),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 41,
                    height: 41,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2F4BB9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.add, color: Colors.white, size: 24),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsGeometry.only(left: 30, right: 30, top: 50),
              child: Column(children: [Row(children: [

                    ],
                  )]),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Navbar(
              items: [
                NavbarItem(
                  icon: Iconify(homeIcon, size: 35),
                  onTap: () {
                    Navigator.pushNamed(context, 'home_screen');
                  },
                  defaultColor: Colors.grey,
                  selectedColor: AppColors.light.primary,
                ),
                NavbarItem(
                  icon: Iconify(mapIcon, size: 35),
                  onTap: () {
                    Navigator.pushNamed(context, 'saved_trip');
                  },
                  defaultColor: Colors.grey,
                  selectedColor: AppColors.light.primary,
                ),
                NavbarItem(
                  icon: Iconify(seacrchIcon, size: 35),
                  onTap: () {},
                  defaultColor: Colors.grey,
                  selectedColor: AppColors.light.primary,
                ),
                NavbarItem(
                  icon: Iconify(userIcon, size: 35),
                  onTap: () {},
                  defaultColor: Colors.grey,
                  selectedColor: AppColors.light.primary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
