import 'package:flutter/material.dart';
import 'package:tasks_app/generated/l10n.dart';

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
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                label: AnimatedSize(
                  duration: const Duration(milliseconds: 150),
                  curve: Curves.fastOutSlowIn,
                  child: Text(
                    isFavorite == true
                        ? appLocale.taskCount(state.favoriteTasks.length)
                        : appLocale.pendingAndCompletedCount(
                            state.pendingTasks.length,
                            state.completedTasks.length,
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
