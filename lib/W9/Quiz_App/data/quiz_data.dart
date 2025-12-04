import '../model/quiz.dart';

final quizData = Quiz(
  questions: [
    Question(
      title: 'Who is the best teacher?',
      choices: ['Ronan', 'Hongly', 'Leangsiv'],
      goodChoice: 'Ronan',
    ),
    Question(
      title: 'What is the best color?',
      choices: ['Blue', 'Red', 'Green'],
      goodChoice: 'Blue',
    ),
    Question(
      title: 'What color is the sky?',
      choices: ['Blue', 'Red', 'Green'],
      goodChoice: 'Blue',
    ),
    Question(
      title: "How many legs does a dog have?", 
      choices: ['2', '4', '6'], 
      goodChoice: '4'
    )
  ],
);