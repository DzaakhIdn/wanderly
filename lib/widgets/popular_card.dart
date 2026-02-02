import 'package:flutter/material.dart';

class PopularCard extends StatefulWidget {
  final String imgUrl;
  final String title;
  final GestureTapCallback? onPressed;

  const PopularCard({
    super.key,
    required this.imgUrl,
    required this.title,
    this.onPressed,
  });

  @override
  State<PopularCard> createState() => _PopularCardState();
}

class _PopularCardState extends State<PopularCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        width: 212,
        height: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          image: DecorationImage(
            image: NetworkImage(widget.imgUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
