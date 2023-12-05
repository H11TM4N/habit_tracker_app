import 'package:flutter/material.dart';

import '../../../common/common.dart';

class KlistTile extends StatelessWidget {
  const KlistTile({
    super.key,
    required this.tileOnTap,
    required this.title,
    required this.isDone,
    required this.onRemove,
    required this.onToggle,
  });

  final VoidCallback tileOnTap;
  final String title;
  final bool isDone;
  final VoidCallback onRemove;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: tileOnTap,
      contentPadding: const EdgeInsets.all(7),
      tileColor: isDone ? const Color(0x0ff61677) : null,
      title: Row(
        children: [
          const SizedBox(
            width: 5,
          ),
          Text(title, style: const TextStyle(fontSize: 20))
        ],
      ),
      subtitle: isDone
          ? const Row(
              children: [
                Icon(Icons.check),
                Text(
                  'completed',
                  style: TextStyle(fontWeight: FontWeight.w100),
                ),
              ],
            )
          : null,
      trailing: IconButton(
        onPressed: () {
          showPopupMenu(
            context,
            onRemove: onRemove,
            toggle: onToggle,
            isCompleted: isDone,
            onEditTap: tileOnTap,
          );
        },
        icon: const Icon(Icons.more_horiz, color: Colors.white),
      ),
    );
  }
}
