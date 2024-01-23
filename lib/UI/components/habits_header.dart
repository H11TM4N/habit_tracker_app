import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker_app/UI/screens/search_screen.dart';
import 'package:habit_tracker_app/common/common.dart';
import 'package:habit_tracker_app/services/providers/habit_povider.dart';
import 'package:habit_tracker_app/services/providers/user_provider.dart';
import 'package:intl/intl.dart';

class HabitsHeader extends ConsumerWidget {
  const HabitsHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).colorScheme;
    final habits = ref.watch(habitProvider).habits;
    final currentDate = dateFormatter(DateTime.now());
    final completed = habits.where((habit) {
      return habit.completionStatus[currentDate] == true;
    }).toList();

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
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      children: [
                        Text(
                          'TODAY',
                          style: GoogleFonts.montserrat(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          DateFormat('MMM, dd').format(DateTime.now()),
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            color: Colors.black45,
                          ),
                        )
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        rightToLeftNavigation(context, const SearchScreen());
                      },
                      icon: const Icon(
                        FontAwesomeIcons.magnifyingGlass,
                        size: 20,
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                child: Column(
                  children: [
                    Text(
                      'Hey, ${ref.watch(userProvider).name}',
                      style: GoogleFonts.montserrat(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      habits.isEmpty
                          ? 'No habits added yet'
                          : 'you have ${habits.length - completed.length} habits left to complete',
                      style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey.shade400),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
