import 'package:flutter/material.dart';

import '../models/tasks.dart';
import '../screens/add_edit_ task_screen.dart';

extension Filter on List<Task> {
  List<Task> get favoriteTask =>
      where((task) => task.isFavorite == true && task.isDeleted == false)
          .toList();

  List<Task> get completedTask =>
      where((task) => task.isDone == true && task.isDeleted == false).toList();

  List<Task> get pendingTask =>
      where((task) => task.isDone == false && task.isDeleted == false).toList();

  List<Task> get removedTask =>
      where((task) => task.isDeleted == true).toList();
}

extension AddEditTask on BuildContext {
  void showAddOrEditTaskBottomSheet({Task? task}) {
    showModalBottomSheet(
      context: this,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: AddOrEditTaskScreen(task: task),
        ),
      ),
    );
  }
}
