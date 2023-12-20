import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker_app/UI/components/components.dart';
import 'package:habit_tracker_app/services/providers/habit_povider.dart';

class SettingListView extends ConsumerWidget {
  const SettingListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextStyle seetingsStyle =
        GoogleFonts.montserrat(fontWeight: FontWeight.w700);

    List<Text> titles = [
      Text('CHANGE DISPLAY NAME', style: seetingsStyle),
      Text('CHANGE AVATAR', style: seetingsStyle),
      Text('ERASE ALL DATA', style: seetingsStyle),
      Text('ADD SOMETHING', style: seetingsStyle),
      Text('ADD SOMETHING', style: seetingsStyle),
      Text('ADD SOMETHING', style: seetingsStyle),
    ];

    List onTaps = [
      () {},
      () {},
      () {
        // ref.read(habitProvider.notifier).clearHabits();
      },
      () {},
      () {},
      () {},
    ];

    final theme = Theme.of(context).colorScheme;
    return Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: Container(
            decoration: BoxDecoration(
              color: theme.primary,
            ),
            child: Column(
              children: [
                SettingTile(
                  title: titles[0],
                  onTap: onTaps[0],
                ),
                const Divider(thickness: 0.4),
                SettingTile(
                  title: titles[1],
                  onTap: onTaps[1],
                ),
                const Divider(thickness: 0.4),
                SettingTile(
                  title: titles[2],
                  onTap: onTaps[2],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: Container(
            decoration: BoxDecoration(
              color: theme.primary,
            ),
            child: Column(
              children: [
                SettingTile(
                  title: titles[3],
                  onTap: onTaps[3],
                ),
                const Divider(thickness: 0.4),
                SettingTile(
                  title: titles[4],
                  onTap: onTaps[4],
                ),
                const Divider(thickness: 0.4),
                SettingTile(
                  title: titles[5],
                  onTap: onTaps[5],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
