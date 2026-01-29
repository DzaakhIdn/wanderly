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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
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
                Expanded(
                  child: Center(
                    child: Text(
                      "Sign In",
                      style: GoogleFonts.quicksand(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF222222),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 41),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsGeometry.only(top: 35, right: 30, left: 30),
              child: Column(children: [
                
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
