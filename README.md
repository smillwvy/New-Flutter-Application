
# Sandwich Shop (Flutter)

A small Flutter app created for the User Experience Design and Implementation module at the University of Portsmouth. The app demonstrates basic Flutter UI, simple state management, and code organisation by letting a user build a single sandwich order with quantity, size, bread choice, and an optional note.

## Key features (implemented)
- Quantity counter with Add / Remove buttons and enforced limits (managed in repositories/order_repository.dart).
- Size selection using a Switch (six‑inch ↔ footlong).
- Bread selection with a Dropdown menu.
- Optional free‑text note via a TextField.
- Live order summary that updates as the user changes selections.
- Shared text styles in lib/views/app_styles.dart.

## Project structure
- lib/
  - main.dart — app entry point and main UI screen.
  - views/
    - app_styles.dart — shared text and style definitions.
  - repositories/
    - order_repository.dart — quantity logic (increase/decrease with limits).
  - view_models/ — reserved for future separation of logic (present but not used for feature logic).
- test/
  - views/widget_test.dart
  - repositories/order_repository_test.dart

(Exact file names and locations are present in the project root shown above.)

## Requirements
- Flutter SDK (stable)
- Dart SDK (comes with Flutter)
- macOS, with Xcode (for iOS) or Android Studio / Android SDK (for Android) if you want to run on emulators/devices
- VS Code (recommended) or Android Studio

## Installation and run (macOS)
1. Clone the repository:
   git clone <your-repository-url>
2. Open project folder in VS Code:
   cd sandwich_shop
3. Get dependencies:
   flutter pub get
4. Run on a connected device or emulator:
   flutter run

## Tests
Run unit/widget tests with:
flutter test

(There are tests for the repository logic and at least one widget test in the test/ folder.)

## Usage
- Tap Add or Remove to change the sandwich quantity (limits enforced by the repository).
- Toggle the size Switch to switch between six‑inch and footlong.
- Open the bread Dropdown to choose a bread type.
- Enter an optional note in the text field.
- The order summary updates immediately to reflect current selections.

## Known limitations / Future improvements
- No persistence: orders are not saved between app sessions.
- Only a single product type (sandwich) is supported.
- Minimal separation of UI and business logic — view_models/ is present for future refactor.
- No navigation to additional screens — single screen app.

## Author
Amalia Poluian  
University of Portsmouth
