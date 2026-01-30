import 'package:flutter/material.dart';
import 'package:wanderly_app/screens/auth/signin_form_screen.dart';
import 'package:wanderly_app/screens/auth/signin_screen.dart';
import 'package:wanderly_app/screens/auth/signup_form_screen.dart';
import 'package:wanderly_app/screens/auth/signup_screen.dart';
import 'package:wanderly_app/screens/home_screen.dart';
import 'package:wanderly_app/screens/onbboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      initialRoute: Onbboarding.routName,
      routes: {
        Onbboarding.routName: (context) => Onbboarding(),
        SigninScreen.routeName: (context) => SigninScreen(),
        SigninFormScreen.routeName: (context) => SigninFormScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        SignupScreen.routeName: (context) => SignupScreen(),
        SignupFormScreen.routeName: (context) => SignupFormScreen(),
      },
    );
  }
}
