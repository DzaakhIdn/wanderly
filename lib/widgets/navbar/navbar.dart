import 'package:flutter/material.dart';
import 'package:wanderly_app/widgets/navbar/navbar_item.dart';

class Navbar extends StatefulWidget {
  final List<NavbarItem> items;
  const Navbar({super.key, required this.items});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(right: 15, left: 15, bottom: 15),
      decoration: BoxDecoration(
        color: Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 20,
            spreadRadius: 10,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: widget.items.asMap().entries.map((entry) {
          int index = entry.key;
          NavbarItem item = entry.value;
          bool isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              item.onTap();
            },
            child: SingleChildScrollView(
              child: Center(
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    isSelected ? item.selectedColor : item.defaultColor,
                    BlendMode.srcIn,
                  ),
                  child: item.icon,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
