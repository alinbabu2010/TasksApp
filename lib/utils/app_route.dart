import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasks_app/screens/login_screen.dart';
import 'package:tasks_app/screens/tabs_screen.dart';
import 'package:tasks_app/screens/trash_screen.dart';

import '../blocs/bloc_exports.dart';
import '../data/repo_exports.dart';

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

  Widget getHomeRoute(User? user) {
    if (user != null) {
      return const TabsScreen();
    } else {
      return RepositoryProvider<AuthRepository>(
        create: (context) => FirebaseAuthRepository(),
        child: const LoginScreen(),
      );
    }
  }
}
