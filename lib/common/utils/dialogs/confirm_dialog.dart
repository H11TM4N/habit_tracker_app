import 'package:flutter/material.dart';

confirmErasureDialog(
  BuildContext context,
  void Function() onPressed,
  TextStyle style,
) {
  final theme = Theme.of(context).colorScheme;
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('erase all data', style: style),
            content: const Text('This action cannot be undone'),
            backgroundColor: theme.primary,
            actions: [
              TextButton(
                onPressed: onPressed,
                child: Text(
                  'YES',
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
