import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:wanderly_app/screens/auth/signin_form_screen.dart';
import 'package:wanderly_app/theme/app_colors.dart';
import 'package:wanderly_app/widgets/button_alternative.dart';
import 'package:wanderly_app/widgets/form_field.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:colorful_iconify_flutter/icons/logos.dart';

class SigninScreen extends StatefulWidget {
  static const routeName = 'signin';
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light.primary,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.only(right: 50, left: 50, top: 90),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Hi, Welcome Back!",
                    style: GoogleFonts.jua(
                      textStyle: TextStyle(
                        color: AppColors.light.secondary,
                        fontSize: 35,
                      ),
                    ),
                  ),
                  Text(
                    "yuk kita susun lagi rencana perjalan mu 😊",
                    style: GoogleFonts.jua(
                      textStyle: TextStyle(
                        fontSize: 13,
                        color: AppColors.light.surface,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.light.surface,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              width: double.infinity,
              height: 575,
              child: Padding(
                padding: const EdgeInsets.only(right: 35, left: 35, top: 55),
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Email Address",
                            style: GoogleFonts.quicksand(
                              textStyle: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF242424),
                              ),
                            ),
                          ),
                          SizedBox(height: 7),
                          FormTextField(
                            label: "Enter your email address",
                            controller: _emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Input tidak boleh kosong'; // Pesan error
                              }
                              if (!value.contains("@")) {
                                return "tipe email salah";
                              }

                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    ButtonColor(
                      text: "Continue with Email",
                      width: double.infinity,
                      onPressed: () {
                        final email = _emailController.text;
                        if (email.isNotEmpty && email.contains("@")) {
                          Navigator.pushNamed(
                            context,
                            'signin_form',
                            arguments: {'email': email},
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Email tidak boleh kosong dan format harus bener',
                              ),
                            ),
                          );
                        }
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Memproses data')),
                          );
                        }
                      },
                    ),
                    SizedBox(height: 33),
                    Column(
                      spacing: 20,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Divider(color: Colors.grey, thickness: 1),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Text(
                                "or continue with",
                                style: GoogleFonts.quicksand(
                                  textStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(color: Colors.grey, thickness: 1),
                            ),
                          ],
                        ),
                        ButtonOutline(
                          text: "Continue with Google",
                          buttonIcon: Iconify(Logos.google_icon),
                          width: double.infinity,
                        ),
                        ButtonOutline(
                          text: "Continue with Apple",
                          buttonIcon: Iconify(Logos.apple),
                          width: double.infinity,
                        ),
                      ],
                    ),
                    SizedBox(height: 43),
                    Row(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: GoogleFonts.quicksand(
                            textStyle: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF333333),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print("tets");
                          },
                          child: Text(
                            "Sign Up",
                            style: GoogleFonts.quicksand(
                              textStyle: TextStyle(
                                fontSize: 13,
                                color: AppColors.light.primary,
                                fontWeight:
                                    FontWeight.w500, // optional: underline
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
