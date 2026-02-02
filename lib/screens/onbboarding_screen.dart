import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wanderly_app/screens/auth/signin_screen.dart';
import 'package:wanderly_app/theme/app_colors.dart';
import 'package:wanderly_app/widgets/button_alternative.dart';

class Onbboarding extends StatelessWidget {
  static const routName = '/';
  const Onbboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light.background,
      body: Stack(
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 175,
                  height: 175,
                  child: Image.asset("assets/important/wanderly_logo.png"),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Wander",
                        style: GoogleFonts.jua(
                          textStyle: TextStyle(
                            fontSize: 31,
                            color: AppColors.light.primary,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: "Ly",
                        style: GoogleFonts.jua(
                          textStyle: TextStyle(
                            fontSize: 31,
                            color: AppColors.light.secondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 231,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.light.surface,
                borderRadius: BorderRadius.circular(24),
              ),
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Garis biru di atas
                  Container(
                    width: 50,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.light.primary,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),

                  // Text heading
                  Text(
                    'Explore the world effortlessly',
                    style: GoogleFonts.jua(
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: AppColors.light.primary,
                      ),
                    ),
                  ),

                  // Button
                  ButtonColor(
                    width: double.infinity,
                    text: 'Get Started',
                    btnColor: AppColors.light.primary,
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        SigninScreen.routeName,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
