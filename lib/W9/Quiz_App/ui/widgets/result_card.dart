import 'package:flutter/material.dart';
import '../../model/quiz.dart';

class ResultCard extends StatelessWidget {
  final Question question;
  final Answer answer;
  final int questionNumber;

  const ResultCard({
    super.key,
    required this.question,
    required this.answer,
    required this.questionNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue[700],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: answer.isGoodAnswer(question.goodChoice)
                      ? Colors.green
                      : Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '$questionNumber',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  question.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ...question.choices.map((choice) {
            
            // Dertermain text color based on correct answer
            Color textColor = Colors.white;
            if (choice == question.goodChoice) {
              textColor = Colors.green;
            } else if (choice == answer.answerChoice &&
                choice != question.goodChoice) {
              textColor = Colors.red;
            }

            return Padding(
              padding: EdgeInsets.symmetric(vertical: 6.0),
              child: Row(
                children: [
                  Icon(
                    choice == question.goodChoice
                        ? Icons.check
                        : (choice == answer.answerChoice &&
                                  choice != question.goodChoice
                              ? Icons.close
                              : Icons.circle_outlined),
                    color: choice == question.goodChoice
                        ? Colors.green
                        : (choice == answer.answerChoice &&
                                  choice != question.goodChoice
                              ? Colors.red
                              : Colors.transparent),
                    size: 24,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      choice,
                      style: TextStyle(fontSize: 16, color: textColor),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
