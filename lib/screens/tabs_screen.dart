import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tasks_app/screens/add_tasks_screen.dart';
import 'package:tasks_app/screens/task_drawer.dart';
import 'package:tasks_app/screens/tasks_screen.dart';

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

  void _addTasks(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: const AddTasksScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageListMap[selectedPage]["title"]),
        actions: [
          if (Platform.isIOS && selectedPage == 0)
            IconButton(
              onPressed: () => _addTasks(context),
              icon: const Icon(Icons.add),
            )
        ],
      ),
      drawer: const TaskDrawer(),
      floatingActionButton: (Platform.isAndroid && selectedPage == 0)
          ? FloatingActionButton(
              onPressed: () => _addTasks(context),
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
            icon: Icon(Icons.list),
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
