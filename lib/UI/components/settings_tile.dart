import 'package:flutter/material.dart';

enum TilePosition { top, bottom, center }

class SettingTile extends StatelessWidget {
  final Text title;
  final void Function()? onTap;
  final TilePosition tilePosition;
  const SettingTile({
    super.key,
    required this.onTap,
    required this.title,
    required this.tilePosition,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 12),
      shape: tilePosition == TilePosition.top
          ? const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)))
          : tilePosition == TilePosition.center
              ? const RoundedRectangleBorder()
              : const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
      title: title,
      tileColor: Theme.of(context).colorScheme.primary,
      onTap: onTap,
    );
  }
}
