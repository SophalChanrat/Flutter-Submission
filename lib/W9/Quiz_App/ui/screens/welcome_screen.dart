import 'package:flutter/material.dart';
import '../widgets/app_button.dart';
import '../../model/quiz.dart';

const quizLogo = 'assets/w9/quiz-logo.png';

class WelcomeScreen extends StatelessWidget {
  final Quiz newQuiz;
  final VoidCallback onStart;
  
  const WelcomeScreen({
    super.key,
    required this.newQuiz,
    required this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(quizLogo, width: 400, height: 300),
            SizedBox(height: 60),
            AppButton(
              "Start Quiz",
              onTap: onStart,
            ),
          ],
        ),
      ),
    );
  }
}