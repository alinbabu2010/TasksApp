import 'package:flutter/material.dart';
import 'package:tasks_app/screens/task_drawer.dart';

import '../widgets/tasks_list.dart';

class TrashScreen extends StatelessWidget {
  const TrashScreen({Key? key}) : super(key: key);

  static const routeName = "trash_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recycle Bin'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Chip(
              label: Text(
                'Tasks',
              ),
            ),
          ),
          TasksList(taskList: List.empty())
        ],
      ),
      drawer: const TaskDrawer(),
    );
  }
}
