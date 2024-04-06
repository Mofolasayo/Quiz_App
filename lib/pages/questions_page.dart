import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/pages/results_page.dart';
import 'package:quiz_app/util/answer_button.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage(
      {super.key, required this.onSelectAnswer, required this.selectedAnswers});
  final void Function(String answer) onSelectAnswer;
  final List<String> selectedAnswers;
  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      if (currentQuestionIndex == questions.length - 1) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ResultPage(
                      chosenAnswers: widget.selectedAnswers,
                    )));
      } else {
        currentQuestionIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: const TextStyle(
                  color: Color.fromARGB(255, 172, 190, 248),
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 25),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answer: answer,
                onTap: () {
                  answerQuestion(answer);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
