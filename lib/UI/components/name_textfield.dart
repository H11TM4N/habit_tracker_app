import 'package:flutter/material.dart';

class NameTextField extends StatelessWidget {
  final TextEditingController controller;
  const NameTextField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
    );
  }
}
