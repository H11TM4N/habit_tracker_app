import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  final String text;
  const Wrapper({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blue[700],
        ),
        child: Text(text),
      ),
    );
  }
}
