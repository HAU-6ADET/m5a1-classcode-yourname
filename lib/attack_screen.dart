import 'package:flutter/material.dart';

/// Module 5 - Activity 1 - HP & the Attack button
///
/// Your first INTERACTIVE screen. `AttackScreen` shows a monster's HP and an
/// Attack button. Because the HP changes over time, this must be a
/// `StatefulWidget` and you must call `setState` when it changes.
///
/// Contract:
///   * HP starts at 40, shown in a `Text` with `key: Key('hp')`.
///   * There is an `ElevatedButton` labelled `Attack`.
///   * Each tap of Attack does 15 damage.
///   * HP never drops below 0 (clamp it).
///   * When HP reaches 0, show a status `Text` with `key: Key('status')` that
///     mentions "fainted".
///
/// Concepts to research: `StatefulWidget` vs `StatelessWidget`, `setState`,
/// `ElevatedButton`'s `onPressed`, and clamping a number (e.g. `.clamp`).
class AttackScreen extends StatefulWidget {
  const AttackScreen({super.key});

  @override
  State<AttackScreen> createState() => _AttackScreenState();
}

class _AttackScreenState extends State<AttackScreen> {
  // TODO: track the current HP in state, starting at 40.

  @override
  Widget build(BuildContext context) {
    // TODO: show the HP (keyed 'hp'), an Attack button that does 15 damage in
    // setState, and a fainted status (keyed 'status') when HP is 0.
    return Scaffold(
      appBar: AppBar(title: const Text('Battle')),
      body: const Center(child: Text('TODO', key: Key('hp'))),
    );
  }
}
