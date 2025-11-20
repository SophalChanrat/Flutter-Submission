import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Custom buttons")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectButton(),
            SizedBox(height: 20),
            SelectButton(),
            SizedBox(height: 20),
            SelectButton(),
            SizedBox(height: 20),
            SelectButton(),
          ],
        ),
      ),
    ),
  ),
);

class SelectButton extends StatefulWidget {
  const SelectButton({super.key});

  @override
  State<SelectButton> createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {
  bool isSelected = false;

  Color get textColor => isSelected ? Colors.white : Colors.black;

  Color? get backgroundColor => isSelected ? Colors.blue[500] : Colors.blue[50];

  String get labelText => isSelected ? "Selected" : "Not Selected";

  void toggleSelected() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: () => {toggleSelected()},
        style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
        child: Center(
          child: Text(labelText, style: TextStyle(color: textColor)),
        ),
      ),
    );
  }
}
