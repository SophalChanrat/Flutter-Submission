import 'package:flutter/material.dart';

class AnswerCard extends StatelessWidget {
  final String answerChoice;

  const AnswerCard({
    super.key,
    required this.answerChoice,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(
            Icons.check,
            color: Colors.green,
            size: 20,
          ),
          SizedBox(width: 8),
          Text(
            answerChoice,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}