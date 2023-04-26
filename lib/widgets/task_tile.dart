import 'package:flutter/material.dart';
import 'package:tasks_app/blocs/bloc_exports.dart';

import '../models/tasks.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
  });

  final Task task;

  void _removeOrDeleteTask(BuildContext context, Task task) {
    context.read<TasksBloc>().add(
          task.isDeleted == true
              ? DeleteTask(task: task)
              : RemoveTask(task: task),
        );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          decoration:
              task.isDone! ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
        value: task.isDone,
        onChanged: task.isDeleted == false
            ? (value) => context.read<TasksBloc>().add(UpdateTask(task: task))
            : null,
      ),
      onLongPress: () => _removeOrDeleteTask(context, task),
    );
  }
}
