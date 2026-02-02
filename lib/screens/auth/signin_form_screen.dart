import 'package:colorful_iconify_flutter/icons/logos.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:wanderly_app/theme/app_colors.dart';
import 'package:wanderly_app/theme/icon_sets.dart';
import 'package:wanderly_app/widgets/button_alternative.dart';
import 'package:wanderly_app/widgets/form_field.dart';

class SigninFormScreen extends StatefulWidget {
  static const routeName = 'signin_form';
  const SigninFormScreen({super.key});

  @override
  State<SigninFormScreen> createState() => _SigninFormScreenState();
}

class _SigninFormScreenState extends State<SigninFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _emailPasswordController =
      TextEditingController();
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      if (args != null && args.containsKey('email')) {
        _emailController.text = args['email'];
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _emailPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
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
              padding: EdgeInsets.only(top: 38, right: 30, left: 30),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 15,
                    children: [
                      Column(
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
                            keyboardType: TextInputType.emailAddress,
                            label: "Enter your email address",
                            controller: _emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Input tidak boleh kosong';
                              }
                              if (!value.contains("@")) {
                                return "tipe email salah";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Password",
                            style: GoogleFonts.quicksand(
                              textStyle: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF242424),
                              ),
                            ),
                          ),
                          SizedBox(height: 7),
                          FormTextField(
                            obscure: _obscurePassword,
                            keyboardType: TextInputType.visiblePassword,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                              icon: Iconify(
                                _obscurePassword ? eyeClosed : eyeOpen,
                              ),
                            ),
                            label: "Enter your Password",
                            controller: _emailPasswordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'pw nya masih kosong wak';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      ButtonColor(
                        text: "Sign In",
                        width: double.infinity,
                        onPressed: () {
                          final email = _emailController.text;
                          final pw = _emailPasswordController.text;
                          if (email.isEmpty || pw.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("disisi yang bener yah☺️"),
                              ),
                            );
                          }
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              "home_screen",
                              (Route<dynamic> route) => false,
                            );
                          }
                        },
                      ),
                      SizedBox(height: 25),
                      Column(
                        spacing: 20,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                ),
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
                                child: Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),
                          ButtonOutline(
                            text: "Continue with Google",
                            buttonIcon: Iconify(Logos.google_icon),
                            width: double.infinity,
                            onPressed: () {
                              print("login google");
                            },
                          ),
                          ButtonOutline(
                            text: "Continue with Apple",
                            buttonIcon: Iconify(Logos.apple),
                            width: double.infinity,
                            onPressed: () {
                              print("login apple");
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 35),
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
          ),
        ],
      ),
    );
  }
}
