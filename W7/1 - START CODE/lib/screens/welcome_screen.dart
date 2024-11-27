import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onStart; // Define the callback

  const WelcomeScreen({super.key, required this.onStart}); // Store the callback

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Welcome to the Quiz!'),
          ElevatedButton(
            onPressed: onStart, // Call the callback when the button is pressed
            child: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
