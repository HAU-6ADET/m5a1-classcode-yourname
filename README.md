# Module 5 - Activity 1 - HP & the Attack button (Flutter)

[![Made with Claude](https://img.shields.io/badge/Made_with-Claude-D97757?logo=anthropic&logoColor=white)](https://tjakoen.github.io/notes/ten-times-zero)
![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white)

Module 4 screens just sat there. Module 5 makes them **react**. This is your
first stateful screen: an HP counter with an Attack button - the heart of the
Module 3 battle logic, now on screen.

## Build this

Open `lib/attack_screen.dart`. Make `AttackScreen` a `StatefulWidget` where:

- HP starts at **40**, shown in a `Text` keyed `Key('hp')`,
- an `ElevatedButton` labelled **`Attack`**,
- each tap does **15 damage** (call `setState`),
- HP never goes below **0** (clamp it),
- when HP hits 0, a status `Text` keyed `Key('status')` mentions "fainted".

## Research

`StatefulWidget`, `setState`, `ElevatedButton.onPressed`, and clamping a number.

## Run and check

```bash
flutter pub get
flutter run       # tap Attack and watch HP fall
flutter test
```

## Submit

Fill in `student.json`, commit, and push.
