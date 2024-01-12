import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tasks_app/blocs/bloc_exports.dart';
import 'package:tasks_app/widgets/popup_menu.dart';

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

  void _markFavoriteOrUnfavorite(BuildContext context, Task task) {
    context.read<TasksBloc>().add(FavoriteOrUnfavoriteTask(task: task));
  }

  void _restoreTask(BuildContext context, Task task) {
    context.read<TasksBloc>().add(RestoreTask(task: task));
  }

  String getFormattedDate() =>
      DateFormat.yMMMd().add_Hm().format(DateTime.parse(task.date));

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 8,
      title: Text(
        task.title,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          decoration:
              task.isDone! ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      subtitle: Text(getFormattedDate()),
      leading: SizedBox(
        height: double.infinity,
        child: Icon(task.isFavorite! ? Icons.star : Icons.star_outline),
      ),
      trailing: FittedBox(
        child: Row(
          children: [
            Checkbox(
              value: task.isDone,
              onChanged: task.isDeleted == false
                  ? (value) =>
                      context.read<TasksBloc>().add(UpdateTask(task: task))
                  : null,
            ),
            PopupMenu(
              cancelOrDeleteCallback: () => _removeOrDeleteTask(context, task),
              favoriteOrUnfavoriteCallback: () =>
                  _markFavoriteOrUnfavorite(context, task),
              restoreCallback: () => _restoreTask(context, task),
              task: task,
            )
          ],
        ),
      ),
    );
  }
}
