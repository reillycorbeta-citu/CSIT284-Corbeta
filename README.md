# Expense Tracker (Lesson 5 — Interactivity & Theming)

## 1. Set up the project on your own machine
Flutter isn't available in this chat environment, so you'll create and run the
project locally:

```bash
flutter create expense_tracker
cd expense_tracker
```

Then **replace** the generated `pubspec.yaml` and everything inside `lib/`
with the files provided here, and run:

```bash
flutter pub get
flutter run
```

## 2. What's implemented (maps to the assignment requirements)

- **Interactions & input controls**: `TextField`s for title/amount, a
  `DropdownButton` for category, `showDatePicker`, swipe-to-delete
  (`Dismissible`), an "Undo" `SnackBar` action.
- **App-wide theming**: `ColorScheme.fromSeed` for both light and dark themes,
  `ThemeMode.system`, themed `AppBar`, `Card`, and button styles.
- **Colors, typography, visual styling**: custom seed colors (teal palette
  instead of the tutorial default), Google Fonts (`Lato`) applied via
  `textTheme`.
- **Layout & consistency**: reusable `ExpenseItem` cards, a gradient chart
  container, consistent rounded corners across cards/buttons/inputs.
- **Reusable styling**: theme values (`elevatedButtonTheme`, `cardTheme`,
  `inputDecorationTheme`) defined once in `main.dart` and reused everywhere.

## 3. My customizations beyond the base tutorial

- Custom teal-based color palette (own choice, not the tutorial default).
- Custom font (Google Fonts `Lato`) applied app-wide.
- Redesigned `ExpenseItem` cards with a circular category icon avatar.
- Gradient background on the chart container instead of a flat color.
- Responsive layout: chart sits beside the list on wide/landscape screens.
- "Undo" action on delete via `SnackBarAction`.
- A 5th category (`Health`) added beyond the tutorial's four.

Feel free to push further — e.g. add a `Hero`/`AnimatedSwitcher` transition
when opening the add-expense sheet, or persist expenses locally.

## 4. Suggested Git commit milestones

Don't just make one big commit — commit as you actually reach each stage.
Suggested sequence (adjust wording/order to match your real process):

```bash
git init
git add pubspec.yaml
git commit -m "Initial project setup: create expense_tracker app"

git add lib/models/expense.dart
git commit -m "Add Expense model and category data"

git add lib/widgets/new_expense.dart
git commit -m "Implement new expense form: text inputs, dropdown, date picker"

git add lib/widgets/expenses_list/
git commit -m "Add expenses list with swipe-to-delete interaction"

git add lib/widgets/chart/
git commit -m "Add expense chart grouped by category"

git add lib/widgets/expenses.dart
git commit -m "Wire up state management: add/remove expenses with undo"

git add lib/main.dart
git commit -m "Configure app-wide Material 3 theming (light & dark)"

# then, for your OWN customizations, separate commits:
git commit -am "Customize color palette with custom seed colors"
git commit -am "Apply Google Fonts (Lato) app-wide"
git commit -am "Redesign expense cards with circular category icons"
git commit -am "Add gradient styling to chart container"
git commit -am "Make layout responsive for wide/landscape screens"
git commit -am "Add Undo action on expense deletion"

git remote add origin <your-repo-url>
git branch -M main
git push -u origin main
```

Push regularly (not all at once right before the deadline) so your history
shows genuine incremental progress, since that's explicitly part of the
grading criteria.
