import 'package:flutter/material.dart';

class AppBAr extends StatelessWidget {
  const AppBAr({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Create habit'),
      actions: [ElevatedButton(onPressed: () {}, child: const Text('SAVE'))],
    );
  }
}
