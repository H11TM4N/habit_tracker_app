import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  final Text title;
  final void Function()? onTap;
  const SettingTile({
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 12),
      title: title,
      onTap: onTap,
    );
  }
}
