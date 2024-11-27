
import 'package:first_project/W7/1%20-%20START%20CODE/lib/model/quiz.dart';

class Answer{
  final String questionAnswer;
  final Question question;

  const Answer({required this.questionAnswer, required this.question});

  bool isCorrect(){
    return questionAnswer == question.goodAnswer;
  }
}

class Submission{
  Map<String, Answer> answers = {};

  int getScore(){
    int score = 0;
    for (var answer in answers.values) {
      if (answer.isCorrect()) {
        score++;
      }
    }
    return score;
  }

  Answer? getAnswerFor(Question question){
    return answers[question.title];
  }
  
  void addAnswer(Question question, String answer){
    answers[question.title] = Answer(questionAnswer: answer, question: question);
  }
  void removeAnswers(){
    answers.clear();
  }
}