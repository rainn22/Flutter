import 'package:flutter/material.dart';
import '../model/quiz.dart';
 
class QuestionScreen extends StatelessWidget {
  final Question question;
  final void Function(String) onAnswer;

  const QuestionScreen({super.key, required this.question, required this.onAnswer});

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
              question.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            ...question.possibleAnswers.map((answer) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    textStyle: const TextStyle(fontSize: 18),
                    backgroundColor: Colors.blue[300],
                  ),
                  onPressed: () => onAnswer(answer),
                  child: Text(
                    answer,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}


 