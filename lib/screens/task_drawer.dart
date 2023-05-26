import 'package:flutter/material.dart';
import 'package:tasks_app/generated/l10n.dart';
import 'package:tasks_app/screens/tabs_screen.dart';
import 'package:tasks_app/screens/trash_screen.dart';

import '../blocs/bloc_exports.dart';
import '../data/repo_exports.dart';
import '../utils/dimens.dart';

class TaskDrawer extends StatelessWidget {
  const TaskDrawer({Key? key}) : super(key: key);

  void _navigate(BuildContext context, String route) {
    Navigator.of(context).pushReplacementNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final appLocale = S.of(context);
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
                appLocale.labelTaskDrawer,
                style: themeData.textTheme.headlineSmall
                    ?.copyWith(color: themeData.colorScheme.onSecondary),
                textAlign: TextAlign.center,
              ),
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                final pendingTaskLength = state.pendingTasks.length;
                final completedTaskLength = state.completedTasks.length;
                return ListTile(
                  leading: const Icon(Icons.folder_special),
                  title: Text(appLocale.labelMyTasks),
                  trailing: Text('$pendingTaskLength | $completedTaskLength'),
                  onTap: () => _navigate(context, TabsScreen.routeName),
                );
              },
            ),
            const Divider(height: Dimens.drawerDividerHeight),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return ListTile(
                  leading: const Icon(Icons.delete),
                  title: Text(appLocale.labelTrash),
                  trailing: Text('${state.removedTasks.length}'),
                  onTap: () => _navigate(context, TrashScreen.routeName),
                );
              },
            ),
            const Divider(height: Dimens.drawerDividerHeight),
            ListTile(
              leading: const Icon(Icons.dark_mode),
              title: Text(appLocale.labelDarkTheme),
              trailing: BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, state) {
                  return Switch(
                    value: state.isDarkTheme,
                    onChanged: (bool value) {
                      context.read<ThemeBloc>().add(UserThemeEvent(value));
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
              title: Text(appLocale.labelSystemTheme),
              trailing: BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, state) {
                  return Switch(
                    value: state.isSystemTheme,
                    onChanged: (bool value) {
                      context.read<ThemeBloc>().add(SystemThemeEvent(value));
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
              leading: const Icon(Icons.logout),
              title: Text(appLocale.labelLogout),
              onTap: () {
                context.read<AuthRepository>().logout().then(
                      (value) =>
                          Navigator.of(context).pushReplacementNamed("/"),
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}
