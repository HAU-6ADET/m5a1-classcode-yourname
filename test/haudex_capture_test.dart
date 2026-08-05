// m5a1 - screenshot capture (teacher-canonical, NOT scored).
//
// The whole point of the activity is that the screen CHANGES, so a shot of the
// starting screen proves nothing. We walk it: full HP, one attack landed, then
// attacked until fainted.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:m5a1_attack_button/attack_screen.dart';

import 'support/haudex_golden.dart';

Future<void> _attack(WidgetTester tester) async {
  await tester.tap(find.widgetWithText(ElevatedButton, 'Attack'));
  await tester.pump();
}

void main() {
  setUpAll(loadHaudexFonts);

  testWidgets('capture: attack flow', (tester) async {
    await pumpHaudex(tester, const AttackScreen());
    await shoot(tester, '01-full-hp');

    await step(tester, '02-one-attack', () async {
      await _attack(tester);
    });

    await step(tester, '03-fainted', () async {
      for (var i = 0; i < 4; i++) {
        await _attack(tester);
      }
    });
  });
}
