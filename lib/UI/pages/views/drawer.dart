import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Drawer(
      backgroundColor: theme.background,
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.task),
                  title: const Text('Todos'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.star_outline),
                  title: const Text('Starred'),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
