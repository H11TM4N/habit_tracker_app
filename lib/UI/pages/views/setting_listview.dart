import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker_app/UI/components/components.dart';
import 'package:habit_tracker_app/common/common.dart';
import 'package:habit_tracker_app/common/utils/dialogs/change_name_dialog.dart';
import 'package:habit_tracker_app/models/enums/gender.dart';
import 'package:habit_tracker_app/services/providers/habit_povider.dart';
import 'package:habit_tracker_app/services/providers/user_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_share/flutter_share.dart';

class SettingListView extends HookConsumerWidget {
  final String displayName;
  const SettingListView({super.key, required this.displayName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController nameController =
        useTextEditingController(text: displayName);

    TextStyle settingsStyle = GoogleFonts.montserrat(
        fontWeight: FontWeight.w700, color: Colors.white);

    List<Text> titles = [
      Text('CHANGE DISPLAY NAME', style: settingsStyle),
      Text('CHANGE AVATAR', style: settingsStyle),
      Text('EDIT GENDER', style: settingsStyle),
      Text('CLEAR USER INFO', style: settingsStyle),
      Text('DISPLAY INFORMATION', style: settingsStyle),
      Text('ERASE ALL DATA', style: settingsStyle),
      Text('SHARE WITH FRIENDS', style: settingsStyle),
      Text('RATE THE APP', style: settingsStyle),
      Text('FEEDBACK', style: settingsStyle),
    ];

    List<IconData> icons = [
      Icons.person,
      Icons.image,
      Icons.male,
      Icons.delete,
      Icons.info,
      Icons.delete_forever,
      Icons.share,
      Icons.rate_review,
      FontAwesomeIcons.penToSquare,
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
      () {
        confirmErasureDialog(context, () {
          ref.read(userProvider.notifier).clearData();
          Navigator.pop(context);
        }, settingsStyle, isErasingAllData: false);
      }, //* index 3
      () {
        displayInfoDialog(context, GoogleFonts.montserrat(color: Colors.grey),
            displayName: ref.watch(userProvider).name,
            gender: enumToStr(ref.watch(userProvider).gender));
      }, //* index 4
      () {
        confirmErasureDialog(context, () {
          ref.read(habitProvider.notifier).clearHabits();
          ref.read(userProvider.notifier).clearData();
          Navigator.pop(context);
        }, settingsStyle, isErasingAllData: true);
      }, //* index 5
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Column(
              children: [
                SettingTile(
                    title: titles[0],
                    icon: icons[0],
                    fillColor: Colors.blue.shade700,
                    onTap: onTaps[0],
                    tilePosition: TilePosition.top),
                SettingTile(
                    title: titles[1],
                    icon: icons[1],
                    fillColor: Colors.yellow.shade700,
                    onTap: onTaps[1],
                    tilePosition: TilePosition.center),
                SettingTile(
                    title: titles[2],
                    icon: icons[2],
                    fillColor: Colors.purpleAccent.shade700,
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
                icon: icons[3],
                fillColor: Colors.red.shade300,
                onTap: onTaps[3],
                tilePosition: TilePosition.top,
              ),
              SettingTile(
                  title: titles[4],
                  icon: icons[4],
                  fillColor: Colors.blue.shade700,
                  onTap: onTaps[4],
                  tilePosition: TilePosition.center),
              SettingTile(
                title: titles[5],
                icon: icons[5],
                fillColor: Colors.red.shade900,
                onTap: onTaps[5],
                tilePosition: TilePosition.bottom,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              SettingTile(
                title: titles[6],
                icon: icons[6],
                fillColor: Colors.blue.shade700,
                onTap: () async {
                  const String appLink =
                      'https://github.com/JER3MIAH/habit_tracker_app';
                  const String message = 'Check out my new app: $appLink';

                  await FlutterShare.share(
                      title: 'Share App', text: message, linkUrl: appLink);
                  //* Display flushbar: "Thanks for sharing"
                },
                tilePosition: TilePosition.top,
              ),
              SettingTile(
                  title: titles[7],
                  icon: icons[7],
                  fillColor: Colors.green.shade700,
                  onTap: () {},
                  tilePosition: TilePosition.center),
              SettingTile(
                title: titles[8],
                icon: icons[8],
                fillColor: Colors.purple.shade400,
                onTap: () {},
                tilePosition: TilePosition.bottom,
              ),
            ],
          ),
        ],
      ),
    );
  }

  enumToStr(Enum enm) {
    if (enm == Gender.male) {
      return 'male';
    } else if (enm == Gender.female) {
      return 'female';
    } else if (enm == Gender.unknown) {
      return 'unknown';
    } else {
      return 'other';
    }
  }
}
