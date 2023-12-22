import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker_app/services/providers/user_provider.dart';

class HabitsHeader extends ConsumerWidget {
  final void Function()? onOpenDrawer;
  const HabitsHeader({
    super.key,
    required this.onOpenDrawer,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
      child: Container(
        decoration: BoxDecoration(
          // image: const DecorationImage(
          //   image: AssetImage('assets/images/task_image.png'),
          // ),
          color: theme.primaryContainer,
          gradient: LinearGradient(
            colors: [
              theme.primary,
              theme.secondary,
            ],
          ),
        ),
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: onOpenDrawer,
                      icon: const Icon(
                        FontAwesomeIcons.barsStaggered,
                        size: 20,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FontAwesomeIcons.magnifyingGlass,
                        size: 20,
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 0),
                child: Text(
                  'Hey, ${ref.watch(userProvider).name}',
                  style: GoogleFonts.montserrat(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
