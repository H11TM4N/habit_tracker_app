import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker_app/common/common.dart';
import 'package:habit_tracker_app/services/providers/habit_povider.dart';
import 'package:habit_tracker_app/services/providers/user_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/enums/gender.dart';
import '../components/components.dart';

class SettingsScreen extends HookConsumerWidget {
  final String displayName;
  const SettingsScreen({super.key, required this.displayName});

  @override
  Widget build(BuildContext context, ref) {
    TextEditingController nameController =
        useTextEditingController(text: displayName);

    TextStyle settingsStyle = GoogleFonts.montserrat(
        fontWeight: FontWeight.w700, color: Colors.white);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Column(
                children: [
                  SettingTile(
                      title: Text('CHANGE DISPLAY NAME', style: settingsStyle),
                      icon: Icons.person,
                      fillColor: Colors.blue.shade700,
                      onTap: () {
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
                      },
                      tilePosition: TilePosition.top),
                  SettingTile(
                      title: Text('EDIT GENDER', style: settingsStyle),
                      icon: Icons.male,
                      fillColor: Colors.purpleAccent.shade700,
                      onTap: () {
                        editGenderDialog(
                          context: context,
                          style: settingsStyle,
                          ref: ref,
                        );
                      },
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
                    title: Text('DISPLAY INFORMATION', style: settingsStyle),
                    icon: Icons.info,
                    fillColor: Colors.blue.shade700,
                    onTap: () {
                      displayInfoDialog(
                          context, GoogleFonts.montserrat(color: Colors.grey),
                          displayName: ref.watch(userProvider).name,
                          gender: enumToStr(ref.watch(userProvider).gender));
                    },
                    tilePosition: TilePosition.top),
                SettingTile(
                  title: Text('CLEAR USER INFO', style: settingsStyle),
                  icon: Icons.delete,
                  fillColor: Colors.red.shade300,
                  onTap: () {
                    confirmErasureDialog(context, () {
                      ref.read(userProvider.notifier).clearData();
                      Navigator.pop(context);
                    }, settingsStyle, isErasingAllData: false);
                  },
                  tilePosition: TilePosition.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                SettingTile(
                  title: Text('ERASE ALL DATA',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700, color: Colors.red)),
                  icon: Icons.delete_forever,
                  fillColor: Colors.red.shade900,
                  onTap: () {
                    confirmErasureDialog(context, () {
                      ref.read(habitProvider.notifier).clearHabits();
                      ref.read(userProvider.notifier).clearData();
                      Navigator.pop(context);
                    }, settingsStyle, isErasingAllData: true);
                  },
                  tilePosition: TilePosition.bottom,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ]),
        ),
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
