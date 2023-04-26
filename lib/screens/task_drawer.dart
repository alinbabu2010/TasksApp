import 'package:flutter/material.dart';
import 'package:tasks_app/screens/tabs_screen.dart';
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
    final themeData = Theme.of(context);
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            Container(
              color: themeData.colorScheme.surface,
              padding: const EdgeInsets.symmetric(
                vertical: Dimens.drawerContainerVPadding,
                horizontal: Dimens.drawerContainerHPadding,
              ),
              child: Text(
                "Task Drawer",
                style: themeData.textTheme.headlineSmall
                    ?.copyWith(color: themeData.colorScheme.onSecondary),
                textAlign: TextAlign.center,
              ),
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return ListTile(
                  leading: const Icon(Icons.folder_special),
                  title: const Text('My Tasks'),
                  trailing: Text(
                      '${state.pendingTasks.length} | ${state.completedTasks.length}'),
                  onTap: () => _navigate(context, TabsScreen.routeName),
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
              leading: const Icon(Icons.dark_mode),
              title: const Text("Dark Theme"),
              trailing: BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, state) {
                  return Switch(
                    value: state.isDarkTheme,
                    onChanged: (bool value) {
                      final event =
                          value ? DarkThemeEvent() : LightThemeEvent();
                      context.read<ThemeBloc>().add(event);
                    },
                  );
                },
              ),
            ),
            const Divider(height: Dimens.drawerDividerHeight),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                vertical: Dimens.drawerThemeTileVPadding,
                horizontal: Dimens.drawerThemeTileHPadding,
              ),
              leading: const Icon(Icons.light_mode),
              title: const Text("System Theme"),
              trailing: BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, state) {
                  return Switch(
                    value: state.isSystemTheme,
                    onChanged: (bool value) {
                      final event = value
                          ? EnableSystemThemeEvent()
                          : DisableSystemThemeEvent();
                      context.read<ThemeBloc>().add(event);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
