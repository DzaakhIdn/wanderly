import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:wanderly_app/theme/app_colors.dart';
import 'package:wanderly_app/theme/font_style.dart';
import 'package:wanderly_app/theme/icon_sets.dart';
import 'package:wanderly_app/widgets/category_card.dart';
import 'package:wanderly_app/widgets/navbar/navbar.dart';
import 'package:wanderly_app/widgets/navbar/navbar_item.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.only(top: 50, right: 20, left: 20),
          child: Column(
            children: [
              Column(
                children: [
                  Text(
                    "Halo Cuy!",
                    style: AppTextStyles.h1(context, FontEngine.google),
                  ),
                ],
              ),
              CategoryCard(icon: homeIcon, label: "rumah"),
              SizedBox(height: 100),
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
