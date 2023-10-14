import 'package:flutter/material.dart';

class Kcard extends StatelessWidget {
  final Widget child;
  final double height;
  const Kcard({
    super.key,
    required this.child,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width;

    return Card(
      child: SizedBox(
        width: cardWidth,
        height: height,
        child: child,
      ),
    );
  }
}
