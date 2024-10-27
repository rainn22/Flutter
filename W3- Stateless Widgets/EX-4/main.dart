import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          CustomCard(text: 'OOP', color: Colors.blue[100]),
          CustomCard(text: 'Dart', color: Colors.blue[300]),
          const CustomCard(text: 'Flutter', useGradient: true)
        ],
      ),
    ),
  ));
}

class CustomCard extends StatelessWidget {

  final String text;
  final Color? color;
  final bool useGradient;

  const CustomCard({
    super.key,
    required this.text,
    this.color,
    this.useGradient = false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50),
        gradient: useGradient
          ? LinearGradient(colors: [Colors.blue[300]!, Colors.blue[600]!]
            )
          : null,
      ),
        padding: const EdgeInsets.all(10),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, decoration: TextDecoration.none)
            ),
          ),
    );
  }
}