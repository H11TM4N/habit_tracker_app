import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker_app/UI/components/components.dart';
import 'package:habit_tracker_app/common/common.dart';
import 'package:habit_tracker_app/common/utils/dialogs/change_name_dialog.dart';
import 'package:habit_tracker_app/models/enums/gender.dart';
import 'package:habit_tracker_app/services/providers/habit_povider.dart';
import 'package:habit_tracker_app/services/providers/user_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingListView extends HookConsumerWidget {
  const SettingListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController nameController = useTextEditingController();

    TextStyle settingsStyle = GoogleFonts.montserrat(
        fontWeight: FontWeight.w700, color: Colors.white);

    List<Text> titles = [
      Text('CHANGE DISPLAY NAME', style: settingsStyle),
      Text('CHANGE AVATAR', style: settingsStyle),
      Text('EDIT GENDER', style: settingsStyle),
      Text('ADD SOMETHING', style: settingsStyle),
      Text('DISPLAY INFORMATION', style: settingsStyle),
      Text('ERASE ALL DATA', style: settingsStyle),
    ];

    List onTaps = [
      () {
        changeNameDialog(
            context: context,
            style: settingsStyle,
            onPressed: () {
              ref
                  .read(userProvider.notifier)
                  .changeUsername(nameController.text);
              nameController.clear();
              Navigator.pop(context);
            },
            controller: nameController);
      }, //* index 0
      () {
        //! Change Avatar
      }, //* index 1
      () {
        editGenderDialog(
          context: context,
          style: settingsStyle,
          ref: ref,
        );
      }, //* index 2
      () {}, //* index 3
      () {
        displayInfoDialog(context, GoogleFonts.montserrat(color: Colors.grey),
            displayName: ref.watch(userProvider).name,
            gender: enumToStr(ref.watch(userProvider).gender));
      }, //* index 4
      () {
        confirmErasureDialog(context, () {
          ref.read(habitProvider.notifier).clearHabits();
          Navigator.pop(context);
        }, settingsStyle);
      }, //* index 5
    ];

    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Column(
            children: [
              SettingTile(
                  title: titles[0],
                  onTap: onTaps[0],
                  tilePosition: TilePosition.top),
              SettingTile(
                  title: titles[1],
                  onTap: onTaps[1],
                  tilePosition: TilePosition.center),
              SettingTile(
                  title: titles[2],
                  onTap: onTaps[2],
                  tilePosition: TilePosition.bottom),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: [
            SettingTile(
              title: titles[3],
              onTap: onTaps[3],
              tilePosition: TilePosition.top,
            ),
            SettingTile(
                title: titles[4],
                onTap: onTaps[4],
                tilePosition: TilePosition.center),
            SettingTile(
              title: titles[5],
              onTap: onTaps[5],
              tilePosition: TilePosition.bottom,
            ),
          ],
        ),
      ],
    );
  }

  enumToStr(Enum enm) {
    if (enm == Gender.male) {
      return 'male';
    } else if (enm == Gender.female) {
      return 'female';
    } else {
      return 'other';
    }
  }
}