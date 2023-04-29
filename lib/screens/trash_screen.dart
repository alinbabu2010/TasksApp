import 'package:flutter/material.dart';
import 'package:tasks_app/screens/task_drawer.dart';
import 'package:tasks_app/widgets/popup_text_button.dart';

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
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: () => context
                    .read<TasksBloc>()
                    .add(const DeleteForeverAllTasks()),
                child: const PopupTextButton(
                  label: "Delete all",
                  icon: Icons.delete_forever_outlined,
                ),
              )
            ],
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
