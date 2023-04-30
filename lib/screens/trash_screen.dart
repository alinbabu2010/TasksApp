import 'package:flutter/material.dart';
import 'package:tasks_app/screens/task_drawer.dart';
import 'package:tasks_app/widgets/popup_text_button.dart';

import '../blocs/bloc_exports.dart';
import '../data/repo_exports.dart';
import '../generated/l10n.dart';
import '../widgets/tasks_list.dart';

class TrashScreen extends StatelessWidget {
  const TrashScreen({Key? key}) : super(key: key);

  static const routeName = "trash_screen";

  @override
  Widget build(BuildContext context) {
    final appLocale = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocale.labelTrash),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: () => context
                    .read<TasksBloc>()
                    .add(const DeleteForeverAllTasks()),
                child: PopupTextButton(
                  label: appLocale.labelDeleteAll,
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
                    appLocale.taskCount(state.removedTasks.length),
                  ),
                ),
              ),
              TasksList(taskList: state.removedTasks)
            ],
          );
        },
      ),
      drawer: RepositoryProvider<AuthRepository>(
        create: (context) => FirebaseAuthRepository(),
        child: const TaskDrawer(),
      ),
    );
  }
}
