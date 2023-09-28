import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // @override
  // void initState() {
  //   super.initState();
  //   Provider.of<HabitProvider>(context, listen: false).loadHabits();
  // }

  @override
  Widget build(BuildContext context) {
    


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Habits'),
        leading: const Icon(Icons.sort),
        actions: [
          IconButton(
            onPressed: () {

            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          

        ],
      ),
    );
  }
}
