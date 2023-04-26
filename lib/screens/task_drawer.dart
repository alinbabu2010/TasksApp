import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasks_app/screens/tasks_screen.dart';
import 'package:tasks_app/screens/trash_screen.dart';

import '../blocs/bloc_exports.dart';
import '../utils/dimens.dart';

class TaskDrawer extends StatelessWidget {
  const TaskDrawer({Key? key}) : super(key: key);

  void _navigate(BuildContext context, String route) {
    Navigator.of(context).pushReplacementNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            Container(
              color: CupertinoColors.systemGrey5,
              padding: const EdgeInsets.symmetric(
                vertical: Dimens.drawerContainerVPadding,
                horizontal: Dimens.drawerContainerHPadding,
              ),
              child: Text(
                "Task Drawer",
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return ListTile(
                  leading: const Icon(Icons.folder_special),
                  title: const Text('My Tasks'),
                  trailing: Text('${state.allTasks.length}'),
                  onTap: () => _navigate(context, TasksScreen.routeName),
                );
              },
            ),
            const Divider(height: Dimens.drawerDividerHeight),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return ListTile(
                  leading: const Icon(Icons.delete),
                  title: const Text('Trash'),
                  trailing: Text('${state.removedTasks.length}'),
                  onTap: () => _navigate(context, TrashScreen.routeName),
                );
              },
            ),
            const Divider(height: Dimens.drawerDividerHeight),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                vertical: Dimens.drawerThemeTileVPadding,
                horizontal: Dimens.drawerThemeTileHPadding,
              ),
              leading: const Icon(Icons.dark_mode),
              title: const Text("Dark Theme"),
              trailing: Switch(
                value: false,
                onChanged: (bool value) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
