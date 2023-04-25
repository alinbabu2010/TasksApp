import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tasks_app/screens/task_drawer.dart';

import '../blocs/bloc_exports.dart';
import '../widgets/tasks_list.dart';
import 'add_tasks_screen.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  static const routeName = "tasks_screen";

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  void _addTasks(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: const AddTasksScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Tasks App'),
            actions: [
              if (Platform.isIOS)
                IconButton(
                  onPressed: () => _addTasks(context),
                  icon: const Icon(Icons.add),
                )
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    '${state.allTasks.length} Tasks',
                  ),
                ),
              ),
              TasksList(taskList: state.allTasks)
            ],
          ),
          drawer: const TaskDrawer(),
          floatingActionButton: Platform.isAndroid
              ? FloatingActionButton(
                  onPressed: () => _addTasks(context),
                  tooltip: 'Add Task',
                  child: const Icon(Icons.add),
                )
              : null,
        );
      },
    );
  }
}
