import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:wanderly_app/theme/app_colors.dart';
import 'package:wanderly_app/theme/icon_sets.dart';

class PopularCard extends StatefulWidget {
  final String imgUrl;
  final String title;
  final double star;
  final GestureTapCallback? onPressed;

  const PopularCard({
    super.key,
    required this.star,
    required this.imgUrl,
    required this.title,
    this.onPressed,
  });

  @override
  State<PopularCard> createState() => _PopularCardState();
}

class _PopularCardState extends State<PopularCard> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        padding: EdgeInsets.only(left: 24, bottom: 28, top: 24, right: 24),
        width: 212,
        height: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          image: DecorationImage(
            image: AssetImage(widget.imgUrl),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withAlpha(100),
              BlendMode.darken,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isLiked = !_isLiked;
                });
              },
              child: Align(
                alignment: Alignment.topRight,
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(30),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Colors.white.withAlpha(50),
                          width: 1,
                        ),
                      ),
                      width: 40,
                      height: 40,
                      child: Center(
                        child: Iconify(
                          likeIcon,
                          size: 25,
                          color: _isLiked ? Colors.pink : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: GoogleFonts.quicksand(
                    textStyle: TextStyle(
                      color: AppColors.light.textSecondary,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      width: 60,
                      padding: EdgeInsets.only(
                        top: 3,
                        bottom: 3,
                        left: 7,
                        right: 7,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(30),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Colors.white.withAlpha(50),
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        spacing: 2,
                        children: [
                          Icon(
                            Icons.star_rounded,
                            size: 18,
                            color: Colors.amber,
                          ),
                          Text(
                            widget.star.toString(),
                            style: GoogleFonts.quicksand(
                              textStyle: TextStyle(
                                color: Colors.white.withAlpha(200),
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
