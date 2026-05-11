// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:my_app/main.dart';

void main() {
  testWidgets('Language home screen renders', (WidgetTester tester) async {
    await tester.pumpWidget(const ScreenAwareApp());

    expect(find.text('ScreenAware'), findsOneWidget);
    expect(find.text('Your privacy is fully protected'), findsOneWidget);
    expect(find.text('French'), findsOneWidget);
    expect(find.text('Arabic'), findsOneWidget);
  });

  testWidgets('French dashboard opens from the home screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ScreenAwareApp());

    await tester.tap(find.text('French'));
    await tester.pumpAndSettle();

    expect(find.text('Menu rapide'), findsOneWidget);
    expect(find.text('Évaluation des risques'), findsOneWidget);
  });

  testWidgets('Arabic home screen opens from the home screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ScreenAwareApp());

    await tester.tap(find.text('Arabic'));
    await tester.pumpAndSettle();

    expect(find.text('الرئيسية'), findsOneWidget);
    expect(find.text('أهلاً بك'), findsOneWidget);
  });
}
