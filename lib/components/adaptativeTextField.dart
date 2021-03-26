import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptativeTextField extends StatelessWidget {
  final TextInputType keyboardType;
  final Function(String) submitForm;
  final TextEditingController controller;
  final String label;

  const AdaptativeTextField({
    this.keyboardType = TextInputType.text,
    this.submitForm,
    this.controller,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CupertinoTextField(
              keyboardType: keyboardType,
              onSubmitted: submitForm,
              controller: controller,
              placeholder: label,
              padding: EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            ),
          )
        : TextField(
            keyboardType: keyboardType,
            onSubmitted: submitForm,
            controller: controller,
            decoration: InputDecoration(
              labelText: label,
            ),
          );
  }
}
