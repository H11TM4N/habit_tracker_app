import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker_app/UI/pages/views/setting_listview.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'ME',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 2, height: 5),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      decoration: BoxDecoration(
                        color: theme.primary,
                      ),
                    ),
                  ),
                  Center(
                    child: CircleAvatar(
                      backgroundColor: theme.primary,
                      backgroundImage:
                          const AssetImage('assets/images/avatar.png'),
                      radius: 80,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primaryContainer),
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.crown,
                    color: Colors.white,
                  ),
                  label: Text(
                    'GO PREMIUM',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  )),
              const SizedBox(height: 20),
              const SettingListView(),

              //TODO: Add Display Info Dialog
            ],
          ),
        ),
      ),
    );
  }
}
