import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker_app/UI/components/components.dart';
import 'package:habit_tracker_app/UI/screens/settings_screen.dart';
import 'package:habit_tracker_app/common/common.dart';
import 'package:habit_tracker_app/models/enums/gender.dart';
import 'package:habit_tracker_app/services/providers/user_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_share/flutter_share.dart';

class SettingListView extends ConsumerWidget {
  final String displayName;
  const SettingListView({super.key, required this.displayName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextStyle settingsStyle = GoogleFonts.montserrat(
        fontWeight: FontWeight.w700, color: Colors.white);

    return SingleChildScrollView(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Column(
              children: [
                SettingTile(
                    title: Text('CHANGE AVATAR', style: settingsStyle),
                    icon: Icons.person,
                    fillColor: Colors.blue.shade700,
                    onTap: () {
                      imageDialog(
                        context,
                        onTakePic: () {
                          ref.read(userProvider.notifier).pickImageFromCamera();
                          if (context.mounted) {
                            Navigator.pop(context);
                          }
                        },
                        onSelectPic: () {
                          ref
                              .read(userProvider.notifier)
                              .pickImageFromGallery();
                          if (context.mounted) {
                            Navigator.pop(context);
                          }
                        },
                      );
                    },
                    tilePosition: TilePosition.top),
                SettingTile(
                    title: Text('NOTIFICATIONS', style: settingsStyle),
                    icon: Icons.notifications,
                    fillColor: Colors.yellow.shade700,
                    onTap: () {},
                    tilePosition: TilePosition.center),
                SettingTile(
                    title: Text('GENERAL SETTINGS', style: settingsStyle),
                    icon: Icons.settings,
                    fillColor: Colors.purpleAccent.shade700,
                    onTap: () {
                      smoothNavigation(
                          context, SettingsScreen(displayName: displayName));
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
                title: Text('SHARE WITH FRIENDS', style: settingsStyle),
                icon: Icons.share,
                fillColor: Colors.blue.shade700,
                onTap: () async {
                  const String appLink =
                      'https://github.com/JER3MIAH/habit_tracker_app';
                  const String message = 'Check out my new app';

                  await FlutterShare.share(
                      title: 'Share App', text: message, linkUrl: appLink);
                  //* Display flushbar: "Thanks for sharing"
                },
                tilePosition: TilePosition.top,
              ),
              SettingTile(
                  title: Text('RATE THE APP', style: settingsStyle),
                  icon: Icons.rate_review,
                  fillColor: Colors.green.shade700,
                  onTap: () {},
                  tilePosition: TilePosition.center),
              SettingTile(
                title: Text('FEEDBACK', style: settingsStyle),
                icon: FontAwesomeIcons.penToSquare,
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
