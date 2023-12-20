import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NameTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String hintText;
  final int? maxLength;
  const NameTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: null,
        inputFormatters: [
          LengthLimitingTextInputFormatter(maxLength),
        ],
        // onTapOutside: (event) => ,
        decoration: InputDecoration(
          // filled: true,
          // fillColor: Theme.of(context).colorScheme.primary,
          hintText: hintText,
          hintStyle: const TextStyle(fontWeight: FontWeight.bold),
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
