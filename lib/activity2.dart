import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              MyGradientButton(
                text: "HELLO 1",
                start: Color(0xff4E7DF5),
                end: Color(0xff0335B6),
              ),

              MyGradientButton(
                text: "HELLO 2",
                start: Color(0xff4E7DF5),
                end: Color(0xff0335B6),
              ),

              MyGradientButton(
                text: "HELLO 3",
                start: Color(0xff4E7DF5),
                end: Color(0xff0335B6),
              ),
            ],
          ),
        ),
      ),
    )
  );
}

class MyGradientButton extends StatelessWidget {
  final String text;
  final Color start;
  final Color end;

  const MyGradientButton({super.key, required this.text, required this.start, required this.end});

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(colors: [start, end]),
            ),
            padding: EdgeInsets.all(40),
            child: Text(
              text,
              style: TextStyle(fontSize: 35, color: Colors.white),
            ),
    );
  }
}