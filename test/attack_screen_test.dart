// m5a1 - HP & the Attack button: behaviour checks (canonical overlay).
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:m5a1_attack_button/attack_screen.dart';

// Contract: starts at 40 HP; each Attack does 15 damage; HP never goes below 0.
Future<void> pump(WidgetTester tester) async {
  await tester.pumpWidget(const MaterialApp(home: AttackScreen()));
}

int hpText(WidgetTester tester) {
  final data = tester.widget<Text>(find.byKey(const Key('hp'))).data ?? '';
  return int.parse(RegExp(r'\d+').firstMatch(data)?.group(0) ?? '-1');
}

Future<void> tapAttack(WidgetTester tester) async {
  await tester.tap(find.widgetWithText(ElevatedButton, 'Attack'));
  await tester.pump();
}

void main() {
  test('student.json is filled in', () {
    final info = jsonDecode(File('student.json').readAsStringSync())
        as Map<String, dynamic>;
    for (final field in [
      'classCode',
      'fullName',
      'studentNumber',
      'studentEmail',
      'personalEmail',
      'githubAccount',
    ]) {
      expect(info[field], isNotEmpty, reason: 'Set "$field" in student.json');
    }
  });

  group('AttackScreen', () {
    testWidgets('starts at 40 HP shown in a Text keyed "hp"', (tester) async {
      await pump(tester);
      expect(find.byKey(const Key('hp')), findsOneWidget,
          reason: 'Show the current HP in a Text keyed Key(\'hp\').');
      expect(hpText(tester), 40);
    });

    testWidgets('has an Attack button', (tester) async {
      await pump(tester);
      expect(find.widgetWithText(ElevatedButton, 'Attack'), findsOneWidget,
          reason: 'Add an ElevatedButton labelled Attack.');
    });

    testWidgets('one Attack does 15 damage (setState updates the screen)',
        (tester) async {
      await pump(tester);
      await tapAttack(tester);
      expect(hpText(tester), 25);
    });

    testWidgets('HP never drops below 0', (tester) async {
      await pump(tester);
      for (var i = 0; i < 5; i++) {
        await tapAttack(tester);
      }
      expect(hpText(tester), 0, reason: 'Clamp HP at 0, do not go negative.');
    });

    testWidgets('shows a fainted status when HP reaches 0', (tester) async {
      await pump(tester);
      for (var i = 0; i < 5; i++) {
        await tapAttack(tester);
      }
      final status =
          (tester.widget<Text>(find.byKey(const Key('status'))).data ?? '')
              .toLowerCase();
      expect(status, contains('faint'),
          reason:
              'When HP is 0, show a status Text keyed Key(\'status\') mentioning fainted.');
    });
  });
}
