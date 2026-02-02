import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:wanderly_app/theme/app_colors.dart';
import 'package:wanderly_app/theme/icon_sets.dart';
import 'package:wanderly_app/widgets/button_alternative.dart';
import 'package:wanderly_app/widgets/dropdown_alternative.dart';
import 'package:wanderly_app/widgets/form_field.dart';

class SignupFormScreen extends StatefulWidget {
  static const routeName = 'signup_form';
  const SignupFormScreen({super.key});

  @override
  State<SignupFormScreen> createState() => _SignupFormScreenState();
}

class _SignupFormScreenState extends State<SignupFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailPasswordController =
      TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _obscurePassword = true;
  String? selectedGender;

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
                      "Sign Up",
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
                      // ! Fullname section
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Full Name",
                            style: GoogleFonts.quicksand(
                              textStyle: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF242424),
                              ),
                            ),
                          ),
                          SizedBox(height: 7),
                          FormTextField(
                            keyboardType: TextInputType.name,
                            label: "Enter your name",
                            controller: _fullNameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'kamu ga punya nama kah?';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),

                      // ! Email address section
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
                                return 'email nya diperhatikan yah';
                              }
                              if (!value.contains("@")) {
                                return "jaman sekarang masih ga tau cara nulis email🙄";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),

                      // ! Gender Section
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Choose your gender",
                            style: GoogleFonts.quicksand(
                              textStyle: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF242424),
                              ),
                            ),
                          ),
                          SizedBox(height: 7),
                          DropdownFormField(
                            label: "Gender",
                            value: selectedGender,
                            items: const [
                              DropdownMenuItem(value: 'L', child: Text('cewe')),
                              DropdownMenuItem(value: 'P', child: Text('cowo')),
                            ],
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value;
                              });
                            },
                            validator: (v) =>
                                v == null ? 'Pilih dulu kocak!' : null,
                          ),
                        ],
                      ),

                      // ! Password section
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Confirm Password",
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
                            label: "confirm your Password",
                            controller: _confirmPasswordController,
                            validator: (value) {
                              final pwAseli = _emailPasswordController.text;

                              if (value != pwAseli) {
                                return 'pw nya ga matching🙄';
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

                      SizedBox(height: 20),
                      Row(
                        spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
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
                              Navigator.pushNamed(context, 'signin');
                            },
                            child: Text(
                              "Sign In",
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
