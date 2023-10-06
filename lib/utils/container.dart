import 'package:flutter/material.dart';

class Kcontainer extends StatelessWidget {
  final Widget widget;

  const Kcontainer({
    super.key,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      margin: const EdgeInsets.all(3),
      padding: const EdgeInsets.all(8.0),
      child: widget,
    );
  }
}
