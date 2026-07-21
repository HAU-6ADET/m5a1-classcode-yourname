import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'attack_screen.dart';

// Entry point. Run it and tap Attack. Your work goes in `attack_screen.dart`.
void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const HaudexApp(),
    ),
  );
}

class HaudexApp extends StatelessWidget {
  const HaudexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: const AttackScreen(),
    );
  }
}
