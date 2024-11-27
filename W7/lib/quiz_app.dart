import 'package:flutter/material.dart';
import 'model/quiz.dart';
import 'model/submission.dart';
import 'screens/question_screen.dart';
import 'screens/result_screen.dart';
import 'screens/welcome_screen.dart';

Color appColor = Colors.blue[500] as Color;

enum QuizState {
  notStarted,
  started,
  finished,
}

class QuizApp extends StatefulWidget {
  const QuizApp(this.quiz, {super.key});

  final Quiz quiz;

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuizState quizState = QuizState.notStarted;
  Submission submission = Submission();
  int currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: _getScreen(),
        ),
      ),
    );
  }

  Widget _getScreen() {
    switch (quizState) {
      case QuizState.notStarted:
        return WelcomeScreen(
          onStart: () {
            setState(() {
              quizState = QuizState.started;
            });
          },
        );
      case QuizState.started:
        return QuestionScreen(
          question: widget.quiz.questions[currentQuestionIndex],
          onAnswer: (answer) {
            submission.addAnswer(widget.quiz.questions[currentQuestionIndex], answer);

            if (currentQuestionIndex == widget.quiz.questions.length - 1) {
              setState(() {
                quizState = QuizState.finished;
              });
            } else {
              setState(() {
                currentQuestionIndex++;
              });
            }
          },
        );
      case QuizState.finished:
        return ResultScreen(
          submission: submission,
          quiz: widget.quiz,
          onRestart: () {
            setState(() {
              quizState = QuizState.notStarted;
              currentQuestionIndex = 0;
              submission.removeAnswers();
            });
          },
        );
      default:
        return Container();
    }
  }
}
