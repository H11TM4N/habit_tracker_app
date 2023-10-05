import 'package:flutter/material.dart';

class KtextField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  const KtextField({
    super.key,
    required this.title,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        maxLength: 40,
        controller: controller,
        decoration: InputDecoration(
          labelText: title,
          hintText: hintText,
          prefix: const Text('e.g.'),
          labelStyle: const TextStyle(color: Colors.grey),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
