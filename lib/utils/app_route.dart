import 'package:flutter/material.dart';
import 'package:tasks_app/screens/tabs_screen.dart';
import 'package:tasks_app/screens/trash_screen.dart';

class AppRoute {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case TabsScreen.routeName:
        return MaterialPageRoute(builder: (_) => const TabsScreen());
      case TrashScreen.routeName:
        return MaterialPageRoute(builder: (_) => const TrashScreen());
      default:
        return null;
    }
  }
}
