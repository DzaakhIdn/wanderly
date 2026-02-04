import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:wanderly_app/_mock/mytrips.dart';
import 'package:wanderly_app/theme/app_colors.dart';
import 'package:wanderly_app/theme/icon_sets.dart';
import 'package:wanderly_app/widgets/mytrip_card.dart';
import 'package:wanderly_app/widgets/navbar/navbar.dart';
import 'package:wanderly_app/widgets/navbar/navbar_item.dart';

class SavedTripScreen extends StatefulWidget {
  static const routName = 'saved_trip';
  const SavedTripScreen({super.key});

  @override
  State<SavedTripScreen> createState() => _SavedTripScreenState();
}

class _SavedTripScreenState extends State<SavedTripScreen> {
  int _selectedTab = 0;

  void _handleEdit(int index) {
    final trip = trips[index];
    final titleController = TextEditingController(text: trip.title);
    final addressController = TextEditingController(text: trip.address);
    final dateStartController = TextEditingController(text: trip.dateStart);
    final dateEndController = TextEditingController(text: trip.dateEnd);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Edit Trip",
            style: GoogleFonts.quicksand(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 12,
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: "Title",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                    labelText: "Address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                TextField(
                  controller: dateStartController,
                  decoration: InputDecoration(
                    labelText: "Date Start",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                TextField(
                  controller: dateEndController,
                  decoration: InputDecoration(
                    labelText: "Date End",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  trips[index] = trips[index].copyWith(
                    title: titleController.text,
                    address: addressController.text,
                    dateStart: dateStartController.text,
                    dateEnd: dateEndController.text,
                  );
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('berhasil ubah')));
              },
              child: Text("Save", style: TextStyle(color: Colors.blue)),
            ),
          ],
        );
      },
    );
  }

  void _handleDelete(int index) {
    setState(() {
      trips.removeAt(index);
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Trip deleted')));
  }

  void _handleEditPassed(int index) {
    final trip = tripsPassed[index];
    final titleController = TextEditingController(text: trip.title);
    final addressController = TextEditingController(text: trip.address);
    final dateStartController = TextEditingController(text: trip.dateStart);
    final dateEndController = TextEditingController(text: trip.dateEnd);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Edit Trip",
            style: GoogleFonts.quicksand(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 12,
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: "Title",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                    labelText: "Address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                TextField(
                  controller: dateStartController,
                  decoration: InputDecoration(
                    labelText: "Date Start",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                TextField(
                  controller: dateEndController,
                  decoration: InputDecoration(
                    labelText: "Date End",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  tripsPassed[index] = tripsPassed[index].copyWith(
                    title: titleController.text,
                    address: addressController.text,
                    dateStart: dateStartController.text,
                    dateEnd: dateEndController.text,
                  );
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Trip updated')));
              },
              child: Text("Save", style: TextStyle(color: Colors.blue)),
            ),
          ],
        );
      },
    );
  }

  void _handleDeletePassed(int index) {
    setState(() {
      tripsPassed.removeAt(index);
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Trip deleted')));
  }

  @override
  Widget build(BuildContext context) {
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
                            Icons.chevron_left_rounded,
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
                      ? Column(
                          children: trips
                              .asMap()
                              .entries
                              .map(
                                (entry) => MytripCard(
                                  title: entry.value.title,
                                  address: entry.value.address,
                                  category: entry.value.category,
                                  categoryIcon: entry.value.categoryIcon,
                                  dateStart: entry.value.dateStart,
                                  dateEnd: entry.value.dateEnd,
                                  imagePath: entry.value.imagePath,
                                  onEdit: () => _handleEdit(entry.key),
                                  onDelete: () => _handleDelete(entry.key),
                                ),
                              )
                              .toList(),
                        )
                      : Column(
                          children: tripsPassed
                              .asMap()
                              .entries
                              .map(
                                (entry) => MytripCard(
                                  title: entry.value.title,
                                  address: entry.value.address,
                                  category: entry.value.category,
                                  categoryIcon: entry.value.categoryIcon,
                                  dateStart: entry.value.dateStart,
                                  dateEnd: entry.value.dateEnd,
                                  imagePath: entry.value.imagePath,
                                  onEdit: () => _handleEditPassed(entry.key),
                                  onDelete: () =>
                                      _handleDeletePassed(entry.key),
                                ),
                              )
                              .toList(),
                        ),
                ),
                SizedBox(height: 100),
              ],
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
