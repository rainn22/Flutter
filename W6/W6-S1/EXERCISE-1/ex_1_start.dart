import 'package:flutter/material.dart';

List<String> colors = ["red", "blue", "green"];

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            const Label("Method 1: Loop in Array", bold: true),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var color in colors) Label(color),
              ],
            ),
            const Label("Method 2: Map", bold: true),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: colors.map((color) => Label(color)).toList(),
            ),
            const Label("Method 23: Dedicated Function", bold: true),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: generateLabels(),
            ),
          ],
        ),
      ),
    ),
  ));
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontWeight: (bold ? FontWeight.bold : FontWeight.normal)),
    );
  }
}

// Dedicated function to generate labels
List<Widget> generateLabels() {
  return colors.map((color) => Label(color)).toList();
}
