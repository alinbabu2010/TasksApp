import 'package:flutter/material.dart';
import 'package:tasks_app/screens/tasks_screen.dart';
import 'package:tasks_app/screens/trash_screen.dart';

class AppRoute {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case TasksScreen.routeName:
        return MaterialPageRoute(builder: (_) => const TasksScreen());
      case TrashScreen.routeName:
        return MaterialPageRoute(builder: (_) => const TrashScreen());
      default:
        return null;
    }
  }
}
