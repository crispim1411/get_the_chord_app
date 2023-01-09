import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_chord_app/config.dart';
import 'package:get_chord_app/main.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'widgets_test.mocks.dart';

@GenerateMocks([PackageInfo])
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
      var mockPackageInfo = MockPackageInfo();
      when(mockPackageInfo.version).thenAnswer((_) => '0.0.0.0');
      Config.kPackageInfo = mockPackageInfo;

      await tester.pumpWidget(const MyApp());
      await tester.tap(find.byKey(const Key('navAbout')));
      await tester.pumpAndSettle();
      expect(find.text('Sobre'), findsOneWidget);
    });
  });
}
