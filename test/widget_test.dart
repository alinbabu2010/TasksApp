// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tasks_app/main.dart';
import 'package:tasks_app/utils/app_route.dart';

class MockStorage extends Mock implements Storage {}

Storage _buildMockStorage() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final storage = MockStorage();
  when(() => storage.write(any(), any<dynamic>())).thenAnswer((_) async {});
  return storage;
}

void main() {
  testWidgets('Sample test', (WidgetTester tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    HydratedBloc.storage = _buildMockStorage();

    await tester.pumpWidget(MyApp(appRouter: AppRoute()));

    expect(find.widgetWithText(Chip, '0 Tasks'), findsOneWidget);

    if (Platform.isAndroid) {
      await tester.tap(find.widgetWithIcon(FloatingActionButton, Icons.add));
    }
    if (Platform.isIOS) {
      await tester.tap(find.byIcon(Icons.add));
    }

    await tester.pump();
  });
}
