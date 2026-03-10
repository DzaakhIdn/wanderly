import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wanderly_app/providers/auth_provider.dart';
import 'package:wanderly_app/theme/app_colors.dart';
import 'package:wanderly_app/widgets/button_alternative.dart';

class UserProfileScreen extends ConsumerWidget {
  static const routeName = 'user_profile';

  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Replace with actual user data from provider/state
    final userName = 'John Doe';
    final userEmail = 'john.doe@example.com';
    final userGender = 'Male';

    return Scaffold(
      backgroundColor: AppColors.light.background,
      appBar: AppBar(
        backgroundColor: AppColors.light.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Profile',
          style: GoogleFonts.quicksand(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Avatar
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: AppColors.light.primary.withAlpha(30),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.person_rounded,
                    size: 60,
                    color: AppColors.light.primary,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // User Name
              Text(
                userName,
                style: GoogleFonts.quicksand(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 24),
              // Profile Info Card
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(10),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Username Field
                    _buildInfoField(
                      label: 'Username',
                      value: userName,
                      icon: Icons.person_outline,
                    ),
                    SizedBox(height: 16),
                    Divider(color: Colors.grey[200]),
                    SizedBox(height: 16),
                    // Email Field
                    _buildInfoField(
                      label: 'Email',
                      value: userEmail,
                      icon: Icons.email_outlined,
                    ),
                    SizedBox(height: 16),
                    Divider(color: Colors.grey[200]),
                    SizedBox(height: 16),
                    // Gender Field
                    _buildInfoField(
                      label: 'Gender',
                      value: userGender,
                      icon: Icons.wc_outlined,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              // Logout Button
              ButtonColor(
                text: 'Logout',
                width: double.infinity,
                onPressed: () {
                  _showLogoutDialog(context, ref);
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoField({
    required String label,
    required String value,
    required IconData icon,
  }) {
    return Row(
      children: [
        Icon(icon, size: 24, color: AppColors.light.primary),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.quicksand(
                  fontSize: 12,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4),
              Text(
                value,
                style: GoogleFonts.quicksand(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showLogoutDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Logout',
            style: GoogleFonts.quicksand(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
          content: Text(
            'Are you sure you want to logout?',
            style: GoogleFonts.quicksand(fontSize: 14, color: Colors.grey[600]),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                ref.read(authServiceProvider).logout();
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  'signin',
                  (Route<dynamic> route) => false,
                );
              },
              child: Text(
                'Logout',
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w600,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
