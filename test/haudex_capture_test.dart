// m5a1 - screenshot capture (teacher-canonical, NOT scored).
import 'package:flutter_test/flutter_test.dart';

import 'package:m5a1_attack_button/attack_screen.dart';

import 'support/haudex_golden.dart';

void main() {
  setUpAll(loadHaudexFonts);

  testWidgets('capture: attack screen', (tester) async {
    await captureScreen(tester, const AttackScreen(), name: 'attack');
  });
}
