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
            titleTextStyle: const TextStyle(fontSize: 15),
            content: NameTextField(
              controller: controller,
              hintText: 'Input new name',
              maxLength: 15,
            ),
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
