import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker_app/UI/components/components.dart';
import 'package:habit_tracker_app/models/enums/gender.dart';
import 'package:habit_tracker_app/services/providers/user_provider.dart';

editGenderDialog({
  required BuildContext context,
  required TextStyle style,
  WidgetRef? ref,
}) {
  final theme = Theme.of(context).colorScheme;

  List<String> text = [
    'MALE',
    'FEMALE',
    'OTHER',
  ];

  List<TilePosition> tilePosition = [
    TilePosition.top,
    TilePosition.center,
    TilePosition.bottom,
  ];

  Gender checkGender(String txt) {
    if (txt == 'MALE') {
      return Gender.male;
    } else if (txt == 'FEMALE') {
      return Gender.female;
    } else {
      return Gender.other;
    }
  }

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      scrollable: false,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 180,
            child: ListView.builder(
              itemCount: text.length,
              itemBuilder: (context, index) {
                return SettingTile(
                  onTap: () {
                    ref
                        ?.read(userProvider.notifier)
                        .changeGender(checkGender(text[index]));
                    Navigator.pop(context);
                  },
                  title: Text(text[index], style: style),
                  tilePosition: tilePosition[index],
                  isSelectedTile: ref?.watch(userProvider).gender ==
                      checkGender(text[index]),
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: theme.primary,
    ),
  );
}
