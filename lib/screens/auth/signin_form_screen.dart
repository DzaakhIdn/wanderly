import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SigninFormScreen extends StatefulWidget {
  static const routeName = 'signin_form';
  const SigninFormScreen({super.key});

  @override
  State<SigninFormScreen> createState() => _SigninFormScreenState();
}

class _SigninFormScreenState extends State<SigninFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 41,
                    height: 41,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2F4BB9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  "Sign In",
                  style: GoogleFonts.quicksand(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF242424),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              // Konten halaman di sini
            ),
          ),
        ],
      ),
    );
  }
}
