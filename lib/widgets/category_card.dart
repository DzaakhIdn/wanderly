import 'package:flutter/material.dart';

class CategoryCard<T> extends StatelessWidget {
  final Widget icon;
  final String label;
  final void Function(T)? onTap;

  const CategoryCard({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector();
  }
}
