import 'package:flutter/material.dart';
import 'package:tasks_app/generated/l10n.dart';
import 'package:tasks_app/utils/extensions.dart';

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
    final appLocale = S.of(context);
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        final pendingTasks = state.allTasks.getPendingTask();
        final completedTasks = state.allTasks.getCompletedTask();
        final favoriteTasks = state.allTasks.getFavoriteTask();

        var tasks = isCompleted == true
            ? completedTasks
            : isFavorite == true
                ? favoriteTasks
                : pendingTasks;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: AnimatedSize(
                  duration: const Duration(milliseconds: 150),
                  curve: Curves.fastOutSlowIn,
                  child: Text(
                    isFavorite == true
                        ? appLocale.taskCount(favoriteTasks.length)
                        : appLocale.pendingAndCompletedCount(
                            pendingTasks.length,
                            completedTasks.length,
                          ),
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
