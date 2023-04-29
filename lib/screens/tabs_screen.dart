import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tasks_app/generated/l10n.dart';
import 'package:tasks_app/screens/task_drawer.dart';
import 'package:tasks_app/screens/tasks_screen.dart';
import 'package:tasks_app/utils/extensions.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  static const routeName = "tabs_screen";

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, dynamic>> getPageListMap(S appLocale) {
    return [
      {"page": const TasksScreen(), "title": appLocale.labelPendingTasks},
      {
        "page": const TasksScreen(isCompleted: true),
        "title": appLocale.labelCompletedTasks
      },
      {
        "page": const TasksScreen(isFavorite: true),
        "title": appLocale.labelFavoriteTasks
      },
    ];
  }

  var selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    final appLocale = S.of(context);
    final pageListMap = getPageListMap(appLocale);
    return Scaffold(
      appBar: AppBar(
        title: Text(pageListMap[selectedPage]["title"]),
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        actions: [
          if (Platform.isIOS && selectedPage == 0)
            IconButton(
              onPressed: () => context.showAddOrEditTaskBottomSheet(),
              icon: const Icon(Icons.add),
            )
        ],
      ),
      drawer: const TaskDrawer(),
      floatingActionButton: (Platform.isAndroid && selectedPage == 0)
          ? FloatingActionButton(
              onPressed: () => context.showAddOrEditTaskBottomSheet(),
              tooltip: appLocale.labelAddTask,
              child: const Icon(Icons.add),
            )
          : null,
      body: pageListMap[selectedPage]["page"],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPage,
        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.incomplete_circle),
            label: appLocale.labelPendingTasks,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.done),
            label: appLocale.labelCompletedTasks,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite),
            label: appLocale.labelFavoriteTasks,
          )
        ],
      ),
    );
  }
}
