import 'package:flutter/material.dart';
import 'package:wanderly_app/screens/auth/signin_form_screen.dart';
import 'package:wanderly_app/screens/auth/signin_screen.dart';
import 'package:wanderly_app/screens/onbboarding.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: Onbboarding.routName,
      routes: {
        Onbboarding.routName: (context) => Onbboarding(),
        SigninScreen.routeName: (context) => SigninScreen(),
        SigninFormScreen.routeName: (context) => SigninFormScreen(),
      },
    );
  }
}
