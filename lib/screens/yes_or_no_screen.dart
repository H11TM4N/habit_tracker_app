import 'package:flutter/material.dart';

class YesOrNoScreen extends StatelessWidget {
  const YesOrNoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create habit'),
        actions: [ElevatedButton(onPressed: () {}, child: const Text('SAVE'))],
      ),
      
    );
  }
}
