import 'package:flutter/material.dart';

class NavbarItem {
  final Widget icon;
  final VoidCallback onTap;
  final Color defaultColor;
  final Color selectedColor;

  NavbarItem({
    required this.icon,
    required this.onTap,
    required this.defaultColor,
    required this.selectedColor,
  });
}
