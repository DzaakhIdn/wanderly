import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscure;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  const FormTextField({
    super.key,
    required this.label,
    required this.controller,
    this.obscure = false,
    this.validator,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        hintText: label,
        hintStyle: GoogleFonts.quicksand(
          textStyle: TextStyle(
            color: Color(0xFFA1A1A1),
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        fillColor: const Color(0xFFF3F2F2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide.none,
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
