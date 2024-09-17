import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSingleTextInputDialog({
  required BuildContext context,
  required String title,
  String positiveButtonText = 'OK',
  String negativeButtonText = 'CLOSE',
  required Function(String) onSubmit,
}) {
  final txtController = TextEditingController();
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            controller: txtController,
            decoration: InputDecoration(
              focusedBorder:  UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 1.0)),
              enabledBorder:  UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0)),
              labelText: 'Enter $title',
              labelStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.normal)
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(negativeButtonText),
          ),
          TextButton(
            onPressed: () {
              if (txtController.text.isEmpty) return Get.back();
              final textString = txtController.text;
              Navigator.pop(context);
              onSubmit(textString);
            },
            child: Text(positiveButtonText),
          )
        ],
      ));
}