import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasks_app/screens/tasks_screen.dart';
import 'package:tasks_app/screens/trash_screen.dart';

import '../utils/dimens.dart';

class TaskDrawer extends StatelessWidget {
  const TaskDrawer({Key? key}) : super(key: key);

  void _navigate(BuildContext context, String route) {
    final navigator = Navigator.of(context);
    final currentRoute = ModalRoute.of(context)?.settings.name;
    if (currentRoute == route) {
      navigator.pop();
    } else {
      navigator.pushNamed(route);
    }
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
            ListTile(
              leading: const Icon(Icons.folder_special),
              title: const Text('My Tasks'),
              trailing: const Text('0'),
              onTap: () => _navigate(context, TasksScreen.routeName),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Trash'),
              trailing: const Text('0'),
              onTap: () => _navigate(context, TrashScreen.routeName),
            ),
          ],
        ),
      ),
    );
  }
}
