import 'package:quiz_app/quiz_question.dart';

const questions = [
  QuizQuestion('What are the main building blocks of Flutter UIs?', [
    'Widgets',
    'Components',
    'Blocks',
    'Functions',
  ]),
  QuizQuestion('How are Flutter UIs built?', [
    'By combining widgets in code',
    'By using XCode for iOS and Android Studio for Android',
    'By dragging and dropping widgets onto a canvas',
    'By writing plain HTML and CSS',
  ]),
  QuizQuestion('What is the purpose of a StatefulWidget?', [
    'To update the UI when data changes over time',
    'To make the app run faster',
    'To style widgets with themes',
    'To connect to a backend server',
  ]),
  QuizQuestion('Which widget should you use more often: StatelessWidget or StatefulWidget?', [
    'StatelessWidget, unless you actually need to manage changing data',
    'StatefulWidget, always',
    'Neither, use only built-in widgets',
    'It does not matter, they behave identically',
  ]),
  QuizQuestion('What happens if you change data inside a StatelessWidget?', [
    'Nothing changes on the screen automatically',
    'The whole app restarts',
    'The UI updates instantly',
    'An error is always thrown',
  ]),
  QuizQuestion('What does calling setState() do?', [
    'It tells Flutter to re-run build() and refresh the UI',
    'It saves data permanently to a database',
    'It closes the current screen',
    'It restarts the entire application',
  ]),
];