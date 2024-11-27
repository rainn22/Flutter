import 'package:flutter/material.dart';
import '../model/quiz.dart';
import '../model/submission.dart';

class ResultScreen extends StatelessWidget {
  final Submission submission;
  final Quiz quiz;
  final VoidCallback onRestart;

  const ResultScreen({
    super.key,
    required this.submission,
    required this.quiz,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.blue[500],
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered ${submission.getScore()} on ${quiz.questions.length}!',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: quiz.questions.length, // Iterate over all questions
                itemBuilder: (context, index) {
                  final question = quiz.questions[index];
                  final answer = submission.getAnswerFor(question);
                  final isCorrect = answer?.isCorrect() ?? false;

                              return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isCorrect ? Colors.green : Colors.red,
                            ),
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            question.title,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      // Display answers with correct or incorrect feedback
                      ...question.possibleAnswers.map((possibleAnswer) {
                        final isAnswerSelected =
                            possibleAnswer == answer?.questionAnswer;
                        final answerColor = isAnswerSelected
                            ? isCorrect
                                ? Colors.green
                                : Colors.red
                            : Colors.black;

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            (possibleAnswer == question.goodAnswer)
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.black,
                                  )
                                : const SizedBox(width: 24),
                              Center(
                                child: Text(
                                  possibleAnswer,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: answerColor,
                                  ),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: onRestart,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50), // Full width button
                  textStyle: const TextStyle(fontSize: 18),
                  backgroundColor: Colors.blue[300],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.refresh, color: Colors.white),
                    Text('Restart Quiz', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}