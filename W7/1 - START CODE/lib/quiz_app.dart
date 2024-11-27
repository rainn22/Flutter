import 'package:flutter/material.dart';
import 'model/quiz.dart';
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: appColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _getScreen(),
            ],
          ),
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
        return QuestionScreen();
      case QuizState.finished:
        return ResultScreen();
      default:
        return Container(); // Empty container in case of an error
    }
  }
}
