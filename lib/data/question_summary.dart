import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({
    super.key,
    required this.summaryData,
  });
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        height: 350,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: summaryData.map((data) {
              final isCorrect = (data['correctAnswer'] == data['userAnswer']);
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        //color: Color.fromARGB(255, 2, 119, 6),
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: isCorrect
                                ? const Color.fromARGB(255, 2, 119, 6)
                                : const Color.fromARGB(255, 241, 98, 88)),

                        child: Center(
                          child: Text(
                            ((data['questionIndex'] as int) + 1).toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['question'] as String,
                            style: const TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 204, 215, 250)),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 5),
                          Text(data['userAnswer'] as String,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: isCorrect
                                      ? Color.fromARGB(151, 204, 215, 250)
                                      : const Color.fromARGB(
                                          255, 241, 98, 88))),
                          Text(data['correctAnswer'] as String,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.green)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
