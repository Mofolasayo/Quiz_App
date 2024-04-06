import 'package:flutter/material.dart';
import 'package:quiz_app/data/question_summary.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/quiz.dart';

class ResultPage extends StatelessWidget {
  ResultPage({
    super.key,
    required this.chosenAnswers,
  });
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'questionIndex': i,
        'question': questions[i].text,
        'correctAnswer': questions[i].answers[0],
        'userAnswer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummary();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = summaryData.where((data) {
      return data['userAnswer'] == data['correctAnswer'];
    }).length;

    return Scaffold(
      backgroundColor: const Color.fromARGB(153, 1, 14, 56),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "You have answered $numCorrectAnswers questions out of $numTotalQuestions correctly!!!",
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 207, 216, 248)),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            QuestionSummary(
              summaryData: summaryData,
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => const Quiz())));
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.restart_alt_rounded),
                    Text(
                      "Restart Quiz",
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
