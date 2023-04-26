import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tasks_app/screens/add_tasks_screen.dart';
import 'package:tasks_app/screens/task_drawer.dart';
import 'package:tasks_app/screens/tasks_screen.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({Key? key}) : super(key: key);

  static const routeName = "tabs_screen";

  void _addTasks(BuildContext context) {
    showModalBottomSheet(
      context: context,
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
        title: const Text("Tabs Screen"),
        actions: [
          if (Platform.isIOS)
            IconButton(
              onPressed: () => _addTasks(context),
              icon: const Icon(Icons.add),
            )
        ],
      ),
      drawer: const TaskDrawer(),
      floatingActionButton: Platform.isAndroid
          ? FloatingActionButton(
              onPressed: () => _addTasks(context),
              tooltip: 'Add Task',
              child: const Icon(Icons.add),
            )
          : null,
      body: const TasksScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {},
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
