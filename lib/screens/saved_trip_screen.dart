import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:wanderly_app/_mock/mytrips.dart';
import 'package:wanderly_app/providers/trip_provider.dart';
import 'package:wanderly_app/theme/app_colors.dart';
import 'package:wanderly_app/theme/icon_sets.dart';
import 'package:wanderly_app/widgets/bottom_dialog.dart';
import 'package:wanderly_app/widgets/modal_dialog.dart';
import 'package:wanderly_app/widgets/mytrip_card.dart';
import 'package:wanderly_app/widgets/navbar/navbar.dart';
import 'package:wanderly_app/widgets/navbar/navbar_item.dart';

class SavedTripScreen extends ConsumerStatefulWidget {
  static const routName = 'saved_trip';
  const SavedTripScreen({super.key});

  @override
  ConsumerState<SavedTripScreen> createState() => _SavedTripScreenState();
}

class _SavedTripScreenState extends ConsumerState<SavedTripScreen> {
  int _selectedTab = 0;

  Widget _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'nature':
        return TripCategory.nature.categoryIcon;
      case 'resto':
        return TripCategory.resto.categoryIcon;
      case 'homestay':
        return TripCategory.homestay.categoryIcon;
      case 'hotel':
        return TripCategory.hotel.categoryIcon;
      default:
        return Icon(Icons.place, size: 16, color: Colors.grey);
    }
  }

  void _handleDelete(int index) {
    ref.read(myTripNotifierProvider.notifier).deleteMyTrip(index);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Trip deleted')));
  }

  @override
  Widget build(BuildContext context) {
    final myTrips = ref.watch(myTripNotifierProvider);

    // Filter trips berdasarkan isDone
    final activeTrips = myTrips.where((trip) => trip.isDone != true).toList();
    final passedTrips = myTrips.where((trip) => trip.isDone == true).toList();

    return Scaffold(
      backgroundColor: AppColors.light.background,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 50,
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 40),
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
                      SizedBox(width: 40),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    spacing: 12,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => _selectedTab = 0),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: _selectedTab == 0
                                  ? AppColors.light.primary
                                  : Colors.grey[300],
                            ),
                            child: Center(
                              child: Text(
                                "Active",
                                style: GoogleFonts.quicksand(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: _selectedTab == 0
                                      ? AppColors.light.textSecondary
                                      : AppColors.light.textPrimary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => _selectedTab = 1),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: _selectedTab == 1
                                  ? AppColors.light.primary
                                  : Colors.grey[300],
                            ),
                            child: Center(
                              child: Text(
                                "Passed",
                                style: GoogleFonts.quicksand(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: _selectedTab == 1
                                      ? AppColors.light.textSecondary
                                      : AppColors.light.textPrimary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: _selectedTab == 0
                      ? activeTrips.isEmpty
                            ? Container(
                                height: 400,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              'assets/images/folder.png',
                                            ),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        "No trips yet",
                                        style: GoogleFonts.quicksand(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "Add your first trip to get started",
                                        style: GoogleFonts.quicksand(
                                          fontSize: 14,
                                          color: Colors.grey[500],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: activeTrips.length,
                                itemBuilder: (context, index) {
                                  final mytrip = activeTrips[index];
                                  return MytripCard(
                                    title: mytrip.title,
                                    address: mytrip.address,
                                    category: mytrip.category,
                                    categoryIcon: _getCategoryIcon(
                                      mytrip.category,
                                    ),
                                    dateStart: mytrip.dateStart,
                                    dateEnd: mytrip.dateEnd,
                                    imagePath: mytrip.imagePath,
                                    onEdit: () => showDialogModal(
                                      context,
                                      ref,
                                      index,
                                      myTrips,
                                    ),
                                    onDelete: () => _handleDelete(index),
                                  );
                                },
                              )
                      : Column(
                          children: [
                            passedTrips.isEmpty
                                ? Container(
                                    height: 400,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 150,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/images/folder.png',
                                                ),
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          Text(
                                            "No passed trips yet",
                                            style: GoogleFonts.quicksand(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            "Complete your first trip to get started",
                                            style: GoogleFonts.quicksand(
                                              fontSize: 14,
                                              color: Colors.grey[500],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: passedTrips.length,
                                    itemBuilder: (context, index) {
                                      final mytrip = passedTrips[index];
                                      return MytripCard(
                                        title: mytrip.title,
                                        address: mytrip.address,
                                        category: mytrip.category,
                                        categoryIcon: _getCategoryIcon(
                                          mytrip.category,
                                        ),
                                        dateStart: mytrip.dateStart,
                                        dateEnd: mytrip.dateEnd,
                                        imagePath: mytrip.imagePath,
                                        onEdit: () => showDialogModal(
                                          context,
                                          ref,
                                          index,
                                          myTrips,
                                        ),
                                        onDelete: () => _handleDelete(index),
                                      );
                                    },
                                  ),
                          ],
                        ),
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
          Positioned(
            bottom: 120, // Di atas navbar
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                showBottomDialog(context, ref);
              },
              backgroundColor: AppColors.light.primary,
              child: Icon(Icons.add, color: Colors.white),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
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
          ),
        ],
      ),
    );
  }
}
