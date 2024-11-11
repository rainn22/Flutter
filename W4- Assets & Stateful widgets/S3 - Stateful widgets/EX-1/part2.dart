import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: Center(
          child: SelectableButton(),
        ),
      ),
    ));

class SelectableButton extends StatefulWidget {
  @override
  _SelectableButtonState createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  bool isSelected = false;

  // Getters to control based on the state
  String get buttonText => isSelected ? "Selected" : "Not Selected";
  Color get textColor => isSelected ? Colors.white : Colors.black;
  Color get backgroundColor => isSelected ? Colors.blue[500]! : Colors.blue[50]!;

  void toggleSelection() {
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
        onPressed: toggleSelection,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
