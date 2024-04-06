import 'package:flutter/material.dart';
import 'package:quiz_app/pages/questions_page.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswers = [];
  void choosenAnswer(String answer) {
    selectedAnswers.add(answer);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(153, 1, 14, 56),
      body: QuestionPage(
          onSelectAnswer: choosenAnswer, selectedAnswers: selectedAnswers),
    );
  }
}
