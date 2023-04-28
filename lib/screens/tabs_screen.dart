import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tasks_app/screens/task_drawer.dart';
import 'package:tasks_app/screens/tasks_screen.dart';
import 'package:tasks_app/utils/extensions.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  static const routeName = "tabs_screen";

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> pageListMap = [
    {"page": const TasksScreen(), "title": "Pending tasks"},
    {"page": const TasksScreen(isCompleted: true), "title": "Completed tasks"},
    {"page": const TasksScreen(isFavorite: true), "title": "Favorite tasks"},
  ];

  var selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageListMap[selectedPage]["title"]),
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        actions: [
          if (Platform.isIOS && selectedPage == 0)
            IconButton(
              onPressed: () => context.showAddOrEditTaskBottomSheet(),
              icon: const Icon(Icons.add),
            )
        ],
      ),
      drawer: const TaskDrawer(),
      floatingActionButton: (Platform.isAndroid && selectedPage == 0)
          ? FloatingActionButton(
        onPressed: () => context.showAddOrEditTaskBottomSheet(),
              tooltip: 'Add Task',
              child: const Icon(Icons.add),
            )
          : null,
      body: pageListMap[selectedPage]["page"],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPage,
        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.incomplete_circle),
            label: "Pending Tasks",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: "Completed Tasks",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite Tasks",
          )
        ],
      ),
    );
  }
}
