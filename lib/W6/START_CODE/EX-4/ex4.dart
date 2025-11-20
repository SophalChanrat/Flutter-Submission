import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScoreCard(title: "My Score in Flutter"),
            SizedBox(height: 20),
            ScoreCard(title: "My Score in Dart"),
            SizedBox(height: 20),
            ScoreCard(title: "My Score in React"),
          ],
        ),
      ),
    ),
  ),
);

class ScoreCard extends StatelessWidget {
  final String title;
  const ScoreCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          ScoreBar(),
        ],
      ),
    );
  }
}

class ScoreBar extends StatefulWidget {
  const ScoreBar({super.key});

  @override
  State<ScoreBar> createState() => _ScoreBarState();
}

class _ScoreBarState extends State<ScoreBar> {
  int score = 1;

  Color get barColor {
    if (score <= 3) {
      return Colors.green[300]!;
    } else if (score <= 6) {
      return Colors.green[500]!;
    } else {
      return Colors.green[800]!;
    }
  }

  void increaseScore() {
    setState(() {
      if (score < 10) score++;
    });
  }

  void decreaseScore() {
    setState(() {
      if (score > 0) score--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                color: Colors.black,
                onPressed: decreaseScore,
              ),
              SizedBox(width: 10),
              IconButton(
                icon: Icon(Icons.add),
                color: Colors.black,
                onPressed: increaseScore,
              ),
            ],
          ),
          SizedBox(height: 20),
          Stack(
            children: [
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 0.5, color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                widthFactor: score / 10,
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: barColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
