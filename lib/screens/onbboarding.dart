import 'package:flutter/material.dart';
import 'package:wanderly_app/widgets/button_alternative.dart';
import 'package:wanderly_app/widgets/form_field.dart';

class Onbboarding extends StatelessWidget {
  Onbboarding({super.key});

  final testControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          children: [
            Center(
              child: ButtonColor(
                text: "coba",
                onPressed: () {
                  print("Button ditekan!");
                },
              ),
            ),
            Stack(
              children: [
                FormTextField(label: "Test", controller: testControler),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
