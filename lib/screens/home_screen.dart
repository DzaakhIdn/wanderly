import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:wanderly_app/theme/app_colors.dart';
import 'package:wanderly_app/theme/font_style.dart';
import 'package:wanderly_app/theme/icon_sets.dart';
import 'package:wanderly_app/widgets/category_card.dart';
import 'package:wanderly_app/widgets/form_field.dart';
import 'package:wanderly_app/widgets/navbar/navbar.dart';
import 'package:wanderly_app/widgets/navbar/navbar_item.dart';
import 'package:wanderly_app/widgets/popular_card.dart';
import 'package:wanderly_app/_mock/trip_mock.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 55, right: 24, left: 24),
          child: Column(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Halo Cuy!", style: AppTextStyles.h1(context)),
                  Text(
                    "Welcome to wanderly",
                    style: AppTextStyles.onBoarding(context),
                  ),
                ],
              ),
              SizedBox(height: 15),
              FormTextField(
                label: "Enter name or category ",
                controller: _searchControler,
                suffixIcon: Icon(Icons.search_rounded, color: Colors.grey),
              ),
              SizedBox(height: 10),
              Text("Category", style: AppTextStyles.h3(context)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 10,
                  children: [
                    CategoryCard(
                      icon: topIcon,
                      label: "Top 30 Places",
                      iconColor: Colors.yellow[800],
                    ),
                    CategoryCard(
                      icon: treeIcon,
                      label: "Nature",
                      iconColor: Colors.green[400],
                    ),
                    CategoryCard(
                      icon: foodIcon,
                      label: "Restoraunt",
                      iconColor: Colors.deepOrange,
                    ),
                    CategoryCard(
                      icon: homeStay,
                      label: "Night Stay",
                      iconColor: Colors.blue[900],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text("Popular", style: AppTextStyles.h3(context)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 10,
                  children: tripMockData
                      .map(
                        (trip) => PopularCard(
                          imgUrl: trip.imagePath,
                          title: trip.title,
                          star: trip.rating,
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Navbar(
        items: [
          NavbarItem(
            icon: Iconify(homeIcon, size: 35),
            onTap: () {},
            defaultColor: Colors.grey,
            selectedColor: AppColors.light.primary,
          ),
          NavbarItem(
            icon: Iconify(mapIcon, size: 35),
            onTap: () {},
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
    );
  }
}
