import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wanderly_app/_mock/trip_mock.dart';
import 'package:wanderly_app/provider/trip_provider.dart';
import 'package:wanderly_app/theme/app_colors.dart';
import 'package:wanderly_app/widgets/button_alternative.dart';
import 'package:wanderly_app/widgets/form_field.dart';
import 'package:wanderly_app/provider/trip_provider.dart';

void showBottomDialog(BuildContext context, WidgetRef ref) {
  final tripNameController = TextEditingController();
  DateTime? startDate;
  DateTime? endDate;
  Trip? selectedTrip;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (dialogContext) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white10,
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
              spacing: 12,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 232, 236, 245),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.save_rounded,
                        color: AppColors.light.primary,
                        size: 28,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Add Trip",
                            style: GoogleFonts.quicksand(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            'save your trip plan',
                            style: GoogleFonts.raleway(
                              fontSize: 14,
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.black45),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nama Trip",
                      style: GoogleFonts.quicksand(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    FormTextField(
                      label: "Masukkan nama trip mu",
                      controller: tripNameController,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pilih Destinasi",
                      style: GoogleFonts.quicksand(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 8),
                    Autocomplete<Trip>(
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text.isEmpty) {
                          return const Iterable<Trip>.empty();
                        }
                        final results = tripMockData.where((Trip option) {
                          return option.title.toLowerCase().contains(
                                textEditingValue.text.toLowerCase(),
                              ) ||
                              option.location.toLowerCase().contains(
                                textEditingValue.text.toLowerCase(),
                              );
                        });
                        return results;
                      },
                      displayStringForOption: (Trip option) => option.title,
                      fieldViewBuilder:
                          (
                            context,
                            textEditingController,
                            focusNode,
                            onFieldSubmitted,
                          ) {
                            return TextField(
                              controller: textEditingController,
                              focusNode: focusNode,
                              decoration: InputDecoration(
                                hintText: "Cari destinasi...",
                                hintStyle: GoogleFonts.quicksand(
                                  color: Color(0xFFA1A1A1),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                                filled: true,
                                fillColor: Colors.grey[100],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 14,
                                ),
                              ),
                            );
                          },
                      optionsViewBuilder: (context, onSelected, options) {
                        return Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Material(
                              elevation: 8,
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                constraints: BoxConstraints(maxHeight: 200),
                                decoration: BoxDecoration(
                                  color: AppColors.light.surface,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: options.isEmpty
                                    ? Container(
                                        height: 10,
                                        width: double.infinity,
                                        child: Padding(
                                          padding: EdgeInsets.all(16),
                                          child: Center(
                                            child: Text(
                                              "Tujuan tidak tersedia",
                                              style: GoogleFonts.quicksand(
                                                fontSize: 14,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : ListView.builder(
                                        padding: EdgeInsets.all(8),
                                        shrinkWrap: true,
                                        itemCount: options.length,
                                        itemBuilder: (context, index) {
                                          final Trip option = options.elementAt(
                                            index,
                                          );
                                          return InkWell(
                                            onTap: () => onSelected(option),
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            child: Container(
                                              padding: EdgeInsets.all(12),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    option.title,
                                                    style:
                                                        GoogleFonts.quicksand(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                  SizedBox(height: 4),
                                                  Text(
                                                    option.location,
                                                    style:
                                                        GoogleFonts.quicksand(
                                                          fontSize: 12,
                                                          color:
                                                              Colors.grey[600],
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                              ),
                            ),
                          ),
                        );
                      },
                      onSelected: (Trip selection) {
                        setState(() {
                          selectedTrip = selection;
                        });
                        debugPrint('Selected: ${selection.title}');
                        debugPrint('All trip data: ${selection.toString()}');
                      },
                    ),
                  ],
                ),
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
                              color: Colors.black87,
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
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today_rounded,
                                    size: 18,
                                    color: Colors.grey[600],
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    startDate != null
                                        ? "${startDate!.day}/${startDate!.month}/${startDate!.year}"
                                        : "Pilih tanggal",
                                    style: GoogleFonts.quicksand(
                                      fontSize: 14,
                                      color: startDate != null
                                          ? Colors.black87
                                          : Colors.grey[600],
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
                              color: Colors.black87,
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
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today_rounded,
                                    size: 18,
                                    color: Colors.grey[600],
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    endDate != null
                                        ? "${endDate!.day}/${endDate!.month}/${endDate!.year}"
                                        : "Pilih tanggal",
                                    style: GoogleFonts.quicksand(
                                      fontSize: 14,
                                      color: endDate != null
                                          ? Colors.black87
                                          : Colors.grey[600],
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
                ButtonColor(
                  text: "Save",
                  width: double.infinity,
                  onPressed: () {
                    if (tripNameController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Nama trip ga bole kosong")),
                      );
                      return;
                    }
                    if (selectedTrip == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("pilih destinasi")),
                      );
                      return;
                    }
                    if (startDate == null || endDate == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("isi tanggal nya")),
                      );
                      return;
                    }
                    ref
                        .read(myTripNotifierProvider.notifier)
                        .addMyTrip(
                          tripNameController.text,
                          startDate!,
                          endDate!,
                          selectedTrip!.id,
                        );
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Trip berhasil ditambahkan!')),
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

                // SizedBox(height: 24),
                // ButtonColor(
                //   text: 'Simpan Trip',
                //   width: double.infinity,
                //   onPressed: () {
                //     // Validasi
                //     if (tripNameController.text.isEmpty) {
                //       ScaffoldMessenger.of(context).showSnackBar(
                //         SnackBar(content: Text('Nama trip harus diisi')),
                //       );
                //       return;
                //     }
                //     if (selectedTrip == null) {
                //       ScaffoldMessenger.of(context).showSnackBar(
                //         SnackBar(content: Text('Pilih destinasi terlebih dahulu')),
                //       );
                //       return;
                //     }
                //     if (startDate == null || endDate == null) {
                //       ScaffoldMessenger.of(context).showSnackBar(
                //         SnackBar(content: Text('Pilih tanggal mulai dan selesai')),
                //       );
                //       return;
                //     }

                //     // Ambil semua data
                //     debugPrint('=== DATA TRIP ===');
                //     debugPrint('Nama Trip: ${tripNameController.text}');
                //     debugPrint('Destinasi: ${selectedTrip!.title}');
                //     debugPrint('Lokasi: ${selectedTrip!.location}');
                //     debugPrint('Category: ${selectedTrip!.category.title}');
                //     debugPrint('Image: ${selectedTrip!.imagePath}');
                //     debugPrint('Rating: ${selectedTrip!.rating}');
                //     debugPrint('Reviews: ${selectedTrip!.reviews}');
                //     debugPrint('Price: ${selectedTrip!.price}');
                //     debugPrint('Tanggal Mulai: $startDate');
                //     debugPrint('Tanggal Selesai: $endDate');
                //     debugPrint('================');

                //     // TODO: Simpan ke provider/database
                //     // ref.read(myTripNotifierProvider.notifier).addMyTrip(
                //     //   tripNameController.text,
                //     //   startDate!,
                //     //   endDate!,
                //     //   selectedTrip!.id,
                //     // );

                //     Navigator.pop(context);
                //     ScaffoldMessenger.of(context).showSnackBar(
                //       SnackBar(content: Text('Trip berhasil ditambahkan!')),
                //     );
                //   },
                // ),
