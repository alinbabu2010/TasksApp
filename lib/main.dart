import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tasks_app/screens/tabs_screen.dart';
import 'package:tasks_app/utils/app_route.dart';
import 'package:tasks_app/utils/app_theme.dart';

import 'blocs/bloc_exports.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  HydratedBloc.storage = storage;
  runApp(TasksApp(appRouter: AppRoute()));
}

class TasksApp extends StatelessWidget {
  const TasksApp({Key? key, required this.appRouter}) : super(key: key);

  final AppRoute appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.deepOrange.shade200));

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TasksBloc()),
        BlocProvider(create: (context) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          final customThemeMode =
              state.isDarkTheme ? ThemeMode.dark : ThemeMode.light;
          final themeMode =
              state.isSystemTheme ? ThemeMode.system : customThemeMode;
          return MaterialApp(
            onGenerateTitle: (context) => S.of(context).appTitle,
            theme: AppThemes.appThemeData[AppTheme.lightTheme],
            debugShowCheckedModeBanner: false,
            darkTheme: AppThemes.appThemeData[AppTheme.darkTheme],
            home: const TabsScreen(),
            themeMode: themeMode,
            onGenerateRoute: appRouter.onGenerateRoute,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
          );
        },
      ),
    );
  }
}
