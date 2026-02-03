import 'package:el_tooltip/el_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:wanderly_app/theme/app_colors.dart';
import 'package:wanderly_app/theme/font_style.dart';

class MytripCard extends StatefulWidget {
  final void Function()? onTap;
  final String imagePath;
  final String title;
  final String dateStart;
  final String dateEnd;
  final String category;
  final String categoryIcon;

  const MytripCard({
    super.key,
    this.onTap,
    required this.title,
    required this.category,
    required this.categoryIcon,
    required this.dateStart,
    required this.dateEnd,
    required this.imagePath,
  });

  @override
  State<MytripCard> createState() => _MytripCardState();
}

class _MytripCardState extends State<MytripCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(10),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 223,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(widget.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          spacing: 10,
                          children: [
                            Text(
                              widget.title,
                              style: AppTextStyles.h2(context),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.light.secondary.withAlpha(40),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                spacing: 6,
                                children: [
                                  Iconify(
                                    widget.categoryIcon,
                                    size: 14,
                                    color: AppColors.light.secondary,
                                  ),
                                  Text(
                                    widget.category,
                                    style: GoogleFonts.quicksand(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.light.secondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElTooltip(
                        content: Text("ayam"),
                        color: AppColors.light.secondary,
                        showModal: false,
                        position: ElTooltipPosition.leftCenter,
                        child: Icon(Icons.more_vert_sharp),
                      ),
                    ],
                  ),
                  Text("Alamat", style: AppTextStyles.bodyStrong(context)),
                  Text(
                    "${widget.dateStart} - ${widget.dateEnd}",
                    style: GoogleFonts.quicksand(
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
