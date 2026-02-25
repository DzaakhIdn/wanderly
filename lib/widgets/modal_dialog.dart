import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void showDialogModal(BuildContext context, WidgetRef ref, int index) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            content: Container(

            ),
          );
        },
      );
    },
  );
}
