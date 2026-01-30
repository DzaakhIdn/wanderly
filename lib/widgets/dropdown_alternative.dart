import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownFormField<T> extends StatelessWidget {
  final String label;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?) onChanged;
  final String? Function(T?)? validator;

  const DropdownFormField({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      items: items,
      onChanged: onChanged,
      validator: validator,
      hint: Text(
        label,
        style: GoogleFonts.quicksand(
          textStyle: TextStyle(
            color: Color(0xFFA1A1A1),
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF3F2F2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
