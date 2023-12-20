import 'package:flutter/material.dart';
import 'package:habit_tracker_app/UI/components/components.dart';

changeNameDialog({
  required BuildContext context,
  required TextStyle style,
  required void Function() onPressed,
  required TextEditingController controller,
}) {
  final theme = Theme.of(context).colorScheme;
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('Change Display Name', style: style),
            content: Expanded(child: NameTextField(controller: controller)),
            backgroundColor: theme.primary,
            actions: [
              TextButton(
                onPressed: onPressed,
                child: Text(
                  'SAVE',
                  style: style,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "CANCEL",
                  style: style,
                ),
              ),
            ],
          ));
}
