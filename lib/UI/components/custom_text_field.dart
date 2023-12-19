import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String hintText;
  final int? maxLength;
  const CustomTextField({
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
          filled: true,
          fillColor: const Color(0xffB6BBC4),
          hintText: hintText,
          hintStyle: const TextStyle(fontWeight: FontWeight.bold),
          contentPadding: const EdgeInsets.all(25),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
