import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  final bool? isCompleted;
  final bool? isFavorite;

  const TasksScreen({
    Key? key,
    this.isCompleted,
    this.isFavorite,
  }) : super(key: key);

  static const routeName = "tasks_screen";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        final pendingTaskLength = state.pendingTasks.length;
        final completedTaskLength = state.completedTasks.length;
        final favoriteTaskLength = state.favoriteTasks.length;

        var tasks = isCompleted == true
            ? state.completedTasks
            : isFavorite == true
                ? state.favoriteTasks
                : state.pendingTasks;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: AnimatedSize(
                  duration: const Duration(milliseconds: 150),
                  curve: Curves.fastOutSlowIn,
                  child: Text(
                    isCompleted == true
                        ? "$completedTaskLength Tasks"
                        : isFavorite == true
                            ? "$favoriteTaskLength Tasks"
                            : "$pendingTaskLength Pending | $completedTaskLength Completed",
                  ),
                ),
              ),
            ),
            TasksList(taskList: tasks)
          ],
        );
      },
    );
  }
}
