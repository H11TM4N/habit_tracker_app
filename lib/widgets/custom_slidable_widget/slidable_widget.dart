import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class KslidableWidget extends StatelessWidget {
  final Widget child;
  final void Function(BuildContext) onCheck;
  final void Function(BuildContext) onDelete;
  final bool isDone;

  const KslidableWidget(
      {super.key,
      required this.child,
      required this.onDelete,
      required this.onCheck,
      required this.isDone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: onDelete,
              backgroundColor: Colors.redAccent,
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              spacing: 34,
              icon: Icons.delete,
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            isDone
                ? SlidableAction(
                    onPressed: onCheck,
                    backgroundColor: Colors.redAccent,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    icon: FontAwesomeIcons.arrowRotateLeft,
                  )
                : SlidableAction(
                    onPressed: onCheck,
                    backgroundColor: Colors.greenAccent,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    icon: FontAwesomeIcons.check,
                  )
          ],
        ),
        child: child,
      ),
    );
  }
}
