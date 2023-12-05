import 'package:flutter/material.dart';

void showPopupMenu(
  BuildContext context, {
  required void Function()? onRemove,
  required void Function()? toggle,
  required bool isCompleted,
}) async {
  final RenderBox button = context.findRenderObject() as RenderBox;
  final RenderBox overlay =
      Overlay.of(context).context.findRenderObject() as RenderBox;

  final RelativeRect position = RelativeRect.fromRect(
    Rect.fromPoints(
      button.localToGlobal(Offset(0, button.size.height), ancestor: overlay),
      button.localToGlobal(button.size.bottomRight(Offset.zero),
          ancestor: overlay),
    ),
    Offset.zero & overlay.size,
  );

  await showMenu(
    context: context,
    position: position,
    items: [
      PopupMenuItem(
        value: 1,
        onTap: onRemove,
        child: const ListTile(
          leading: Icon(Icons.delete_outline),
          title: Text('REMOVE'),
        ),
      ),
      PopupMenuItem(
        value: 2,
        onTap: toggle,
        child: ListTile(
          leading: Icon(isCompleted ? Icons.refresh : Icons.check),
          title: Text(isCompleted ? 'UNDO' : 'FINISH'),
        ),
      ),
    ],
    elevation: 8.0,
  );
}
