import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wanderly_app/models/trip.dart';
import 'package:wanderly_app/providers/trip_provider.dart';
import 'package:wanderly_app/theme/app_colors.dart';
import 'package:wanderly_app/widgets/button_alternative.dart';

void showEditTripDialog(
  BuildContext context,
  WidgetRef ref,
  int tripIndex,
  MyTrip trip,
) {
  final tripNameController = TextEditingController(text: trip.title);
  DateTime? startDate = trip.dateStartAsDateTime;
  DateTime? endDate = trip.dateEndAsDateTime;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (dialogContext) {
      return StatefulBuilder(
        builder: (context, setState) {
          final colors = AppColors.of(context);

          return Container(
            decoration: BoxDecoration(
              color: colors.background,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 24,
              left: 24,
              right: 24,
              top: 24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: colors.surface,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.edit_rounded,
                        color: colors.primary,
                        size: 28,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Edit Trip",
                            style: GoogleFonts.quicksand(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: colors.textPrimary,
                            ),
                          ),
                          Text(
                            'update your trip plan',
                            style: GoogleFonts.raleway(
                              fontSize: 14,
                              color: colors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: colors.textSecondary),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  "Nama Trip",
                  style: GoogleFonts.quicksand(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: colors.textPrimary,
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: tripNameController,
                  style: TextStyle(color: colors.textPrimary),
                  decoration: InputDecoration(
                    hintText: "Masukkan nama trip mu",
                    hintStyle: GoogleFonts.quicksand(
                      color: colors.textSecondary,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    filled: true,
                    fillColor: colors.surface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  spacing: 12,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tanggal Mulai",
                            style: GoogleFonts.quicksand(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: colors.textPrimary,
                            ),
                          ),
                          SizedBox(height: 8),
                          InkWell(
                            onTap: () async {
                              final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: startDate ?? DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2030),
                              );
                              if (picked != null) {
                                setState(() {
                                  startDate = picked;
                                });
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                              decoration: BoxDecoration(
                                color: colors.surface,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today_rounded,
                                    size: 18,
                                    color: colors.textSecondary,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    startDate != null
                                        ? "${startDate!.day}/${startDate!.month}/${startDate!.year}"
                                        : "Pilih tanggal",
                                    style: GoogleFonts.quicksand(
                                      fontSize: 14,
                                      color: startDate != null
                                          ? colors.textPrimary
                                          : colors.textSecondary,
                                      fontWeight: startDate != null
                                          ? FontWeight.w600
                                          : FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tanggal Selesai",
                            style: GoogleFonts.quicksand(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: colors.textPrimary,
                            ),
                          ),
                          SizedBox(height: 8),
                          InkWell(
                            onTap: () async {
                              final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate:
                                    endDate ?? startDate ?? DateTime.now(),
                                firstDate: startDate ?? DateTime.now(),
                                lastDate: DateTime(2030),
                              );
                              if (picked != null) {
                                setState(() {
                                  endDate = picked;
                                });
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                              decoration: BoxDecoration(
                                color: colors.surface,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today_rounded,
                                    size: 18,
                                    color: colors.textSecondary,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    endDate != null
                                        ? "${endDate!.day}/${endDate!.month}/${endDate!.year}"
                                        : "Pilih tanggal",
                                    style: GoogleFonts.quicksand(
                                      fontSize: 14,
                                      color: endDate != null
                                          ? colors.textPrimary
                                          : colors.textSecondary,
                                      fontWeight: endDate != null
                                          ? FontWeight.w600
                                          : FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                ButtonColor(
                  text: 'Update Trip',
                  width: double.infinity,
                  onPressed: () {
                    if (tripNameController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Nama trip harus diisi')),
                      );
                      return;
                    }
                    if (startDate == null || endDate == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Pilih tanggal mulai dan selesai'),
                        ),
                      );
                      return;
                    }

                    ref
                        .read(myTripNotifierProvider.notifier)
                        .updateMyTrip(
                          tripIndex,
                          tripNameController.text,
                          startDate!,
                          endDate!,
                        );

                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Trip berhasil diupdate!')),
                    );
                  },
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
