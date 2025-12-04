import 'package:flutter/material.dart';
import '../../model/quiz.dart';
import '../widgets/result_card.dart';
import '../widgets/app_button.dart';

class ResultScreen extends StatelessWidget {
  final Quiz newQuiz;
  final VoidCallback onRestart;
  
  const ResultScreen({
    super.key,
    required this.newQuiz,
    required this.onRestart,
  });

  List<Answer> get userAnswers => newQuiz.answers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30),
            Text(
              'You answered ${newQuiz.questionTotalScore} on ${newQuiz.questions.length} !',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    newQuiz.questions.length,
                    (index) => ResultCard(
                      question: newQuiz.questions[index],
                      answer: userAnswers[index],
                      questionNumber: index + 1,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: AppButton(
                'Restart Quiz',
                onTap: onRestart,
              ),
            ),
          ],
        ),
      ),
    );
  }
}