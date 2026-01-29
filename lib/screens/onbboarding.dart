import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:wanderly_app/widgets/button_alternative.dart';
import 'package:wanderly_app/widgets/form_field.dart';
import 'package:wanderly_app/widgets/navbar/icon_sets.dart';
import 'package:wanderly_app/widgets/navbar/navbar.dart';
import 'package:wanderly_app/widgets/navbar/navbar_item.dart';

class Onbboarding extends StatelessWidget {
  Onbboarding({super.key});

  final testControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(35.0),
            child: Column(
              children: [
                Center(
                  child: ButtonColor(
                    text: "coba",
                    onPressed: () {
                      print("Button ditekan!");
                    },
                  ),
                ),
                Stack(
                  children: [
                    FormTextField(label: "Test", controller: testControler),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentGeometry.bottomCenter,
            child: Navbar(
              items: [
                NavbarItem(
                  icon: Iconify(homeIcon, size: 40),
                  defaultColor: Colors.grey,
                  selectedColor: Colors.amber,
                  onTap: () {},
                ),
                NavbarItem(
                  icon: Iconify(seacrchIcon, size: 40),
                  defaultColor: Colors.grey,
                  selectedColor: Colors.blue,
                  onTap: () {},
                ),
                NavbarItem(
                  icon: Iconify(mapIcon, size: 40),
                  defaultColor: Colors.grey,
                  selectedColor: Colors.green,
                  onTap: () {},
                ),
                NavbarItem(
                  icon: Iconify(userIcon, size: 40),
                  defaultColor: Colors.grey,
                  selectedColor: Colors.purple,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
