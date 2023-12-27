import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker_app/common/common.dart';
import 'package:habit_tracker_app/common/widgets/custom_tile.dart';
import 'package:habit_tracker_app/models/habit.dart';
import 'package:habit_tracker_app/services/providers/habit_povider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchScreen extends HookConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();

    final habits = ref.watch(habitProvider);
    final foundUsers = useState(<Habit>[]);
    var results = useState(<Habit>[]);

    foundUsers.value = habits;

    void runFilter(String enteredKeyword) {
      if (enteredKeyword.isEmpty) {
        results.value = habits;
      } else {
        results.value = habits
            .where((habit) => habit.title
                .toLowerCase()
                .startsWith(enteredKeyword.toLowerCase()))
            .toList();
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SearchBar(
                backgroundColor: const MaterialStatePropertyAll(Colors.grey),
                controller: searchController,
                onChanged: (value) => runFilter(value),
                leading: const CustomBackButton(),
                hintText: 'Search for your habits',
                hintStyle: MaterialStatePropertyAll(GoogleFonts.montserrat()),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  itemCount: results.value.length,
                  itemBuilder: (context, index) {
                    return CustomTile(
                      title: results.value[index].title,
                      onTap: () {},
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
