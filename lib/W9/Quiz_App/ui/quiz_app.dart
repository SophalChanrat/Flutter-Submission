import 'package:flutter/material.dart';
import '../data/quiz_data.dart';
import 'screens/welcome_screen.dart';
import 'screens/question_screen.dart';
import 'screens/result_screen.dart';

enum QuizScreen { welcome, question, result }
 
class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuizScreen currentScreen = QuizScreen.welcome;

  void switchScreen(QuizScreen screen) {
    setState(() {
      currentScreen = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screen;
    
    switch (currentScreen) {
      case QuizScreen.welcome:
        screen = WelcomeScreen(
          newQuiz: quizData,
          onStart: () => switchScreen(QuizScreen.question),
        );
        break;
      case QuizScreen.question:
        screen = QuestionScreen(
          questions: quizData.questions,
          onFinished: () => switchScreen(QuizScreen.result),
        );
        break;
      case QuizScreen.result:
        screen = ResultScreen(
          newQuiz: quizData,
          onRestart: () => switchScreen(QuizScreen.welcome),
        );
        break;
    }

    return MaterialApp(
      home: Scaffold(
        body: screen,
      ),
    );
  }
}