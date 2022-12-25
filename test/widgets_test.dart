import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_chord_app/main.dart';
import 'package:get_chord_app/form/form.dart';

void main() {
  group('Page render tests', () {
    testWidgets('load form page', (tester) async {
      await tester.pumpWidget(const MyApp());
      expect(find.byKey(const Key('FormPage')), findsOneWidget);
    });

    testWidgets('load dict page', (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.tap(find.byKey(const Key('navDict')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('DictPage')), findsOneWidget);
    });

    testWidgets('load about page', (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.tap(find.byKey(const Key('navAbout')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('AboutPage')), findsOneWidget);
    });
  });
}