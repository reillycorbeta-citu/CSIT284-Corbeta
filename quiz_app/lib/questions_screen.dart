import 'package:flutter/material.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/answer_button.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({
    super.key,
    required this.currentQuestionIndex,
    required this.currentAnswer,
    required this.onSelectAnswer,
    required this.onGoBack,
  });

  final int currentQuestionIndex;
  final String currentAnswer;
  final void Function(String answer) onSelectAnswer;
  final void Function()? onGoBack;

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Question ${currentQuestionIndex + 1} of ${questions.length}',
            style: const TextStyle(color: Colors.white70, fontSize: 16, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(currentQuestion.text,
              style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          const SizedBox(height: 30),
          ...currentQuestion.getShuffledAnswers().map((answer) {
            final isSelected = answer == currentAnswer;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: AnswerButton(
                answerText: answer,
                isSelected: isSelected,
                onTap: () => onSelectAnswer(answer),
              ),
            );
          }),
          const SizedBox(height: 10),
          if (onGoBack != null)
            TextButton.icon(
              onPressed: onGoBack,
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Back'),
            ),
        ],
      ),
    );
  }
}