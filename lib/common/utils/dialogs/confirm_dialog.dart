import 'package:flutter/material.dart';

confirmErasureDialog(
    BuildContext context, void Function() onPressed, TextStyle style,
    {required bool isErasingAllData}) {
  final theme = Theme.of(context).colorScheme;
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(isErasingAllData ? 'erase all data' : 'clear user data',
                style: style),
            content: Text(isErasingAllData
                ? 'This action cannot be undone'
                : 'user info will be set back to default'),
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
