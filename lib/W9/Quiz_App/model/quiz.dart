import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Answer {
  final String id;
  final String answerChoice;

  Answer({required this.answerChoice}) : id = uuid.v4();

  bool isGoodAnswer(String correctAnswer) {
    return answerChoice == correctAnswer;
  }
}

class Question {
  final String id;
  final String title;
  final List<String> choices;
  final String goodChoice;

  Question({
    required this.title,
    required this.choices,
    required this.goodChoice,
  }) : id = uuid.v4();
}

class Quiz {
  List<Question> questions;
  List<Answer> answers;

  Quiz({required this.questions, List<Answer>? answers,}) : answers = answers ?? [];

  int get questionTotalScore {
    int count = 0;
    for (int i = 0; i < questions.length; i++) {
      if (i < answers.length) {
        if (answers[i].isGoodAnswer(questions[i].goodChoice)) {
          count++;
        }
      }
    }
    return count;
  }
}