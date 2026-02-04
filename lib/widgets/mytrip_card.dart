import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wanderly_app/theme/app_colors.dart';
import 'package:wanderly_app/theme/font_style.dart';
import 'package:wanderly_app/_mock/mytrips.dart';

class MytripCard extends StatefulWidget {
  final void Function()? onTap;
  final String imagePath;
  final String title;
  final String address;
  final String dateStart;
  final String dateEnd;
  final String category;
  final Widget categoryIcon;

  const MytripCard({
    super.key,
    this.onTap,
    required this.title,
    required this.address,
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
                              style: AppTextStyles.h3(context),
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
                                  widget.categoryIcon,
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
                      PopupMenuButton<String>(
                        padding: EdgeInsets.zero,
                        color: AppColors.light.secondary,
                        icon: Icon(Icons.more_vert),
                        onSelected: (value) {
                          if (value == 'edit') {
                          } else if (value == 'delete') {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    "are you sure??!",
                                    style: GoogleFonts.quicksand(
                                      textStyle: TextStyle(
                                        color: AppColors.light.error,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  content: Text(
                                    "Kamu yakin mau hapus item ini huh?!",
                                    style: GoogleFonts.quicksand(
                                      textStyle: TextStyle(
                                        color: AppColors.light.textPrimary,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {},
                                      child: Text("iya"),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 'edit',
                            child: Row(
                              children: [
                                Icon(
                                  Icons.edit,
                                  size: 18,
                                  color: Color(0xFF2F4BB9),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Edit',
                                  style: GoogleFonts.quicksand(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF2F4BB9),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: 'delete',
                            child: Row(
                              children: [
                                Icon(Icons.delete, size: 18, color: Colors.red),
                                SizedBox(width: 8),
                                Text(
                                  'Delete',
                                  style: GoogleFonts.quicksand(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    widget.address,
                    style: AppTextStyles.bodyStrong(context),
                  ),
                  SizedBox(height: 5),
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
