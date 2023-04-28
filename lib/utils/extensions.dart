import 'package:flutter/material.dart';

import '../models/tasks.dart';
import '../screens/add_edit_ task_screen.dart';

extension Filter on List<Task> {
  List<Task> getFavoriteTask() {
    return where((task) => task.isFavorite == true).toList();
  }

  List<Task> getCompletedTask() {
    return where((task) => task.isDone == true).toList();
  }

  List<Task> getPendingTask() {
    return where((task) => task.isDone == false).toList();
  }
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
