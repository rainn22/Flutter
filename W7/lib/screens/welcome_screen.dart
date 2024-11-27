import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onStart;
    final String image = "assets/w7/quiz-logo.png";

  const WelcomeScreen({super.key, required this.onStart});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[500],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 500, 
            child: Image.asset(
              image,
              scale: 2.0, 
              fit: BoxFit.cover, 
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Crazy Quizz',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 50),
          Center(
            child: SizedBox(
              width: 200, 
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15),
                  textStyle: const TextStyle(fontSize: 18), 
                ),
                onPressed: onStart,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_forward),
                    SizedBox(width: 10),
                    Text('Start Quiz'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

