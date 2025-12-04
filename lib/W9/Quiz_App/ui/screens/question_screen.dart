import 'package:flutter/material.dart';
import '../../model/quiz.dart';
import '../widgets/app_button.dart';
import '../../data/quiz_data.dart';

class QuestionScreen extends StatefulWidget {
  final List<Question> questions;
  final VoidCallback onFinished;

  const QuestionScreen({
    super.key,
    required this.questions,
    required this.onFinished,
  });

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestion = 0;
  List<Answer> userAnswers = [];

  void onAnswerSelected(String choice) {
    setState(() {
      userAnswers.add(Answer(answerChoice: choice));
      
      if (currentQuestion < widget.questions.length - 1) {
        currentQuestion++;
      } else {
        quizData.answers = userAnswers;
        widget.onFinished();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Question question = widget.questions[currentQuestion];

    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                question.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              ...question.choices.map(
                (choice) => Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: AppButton(
                    choice,
                    onTap: () => onAnswerSelected(choice),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}