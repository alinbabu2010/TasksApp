import 'package:flutter/material.dart';
import 'package:tasks_app/screens/task_drawer.dart';

import '../blocs/bloc_exports.dart';
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
      body: BlocBuilder<TasksBloc, TasksState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    '${state.removedTasks.length} Tasks',
                  ),
                ),
              ),
              TasksList(taskList: state.removedTasks)
            ],
          );
        },
      ),
      drawer: const TaskDrawer(),
    );
  }
}
