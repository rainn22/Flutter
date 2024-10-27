import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      padding: const EdgeInsets.all(20),
        child: Column(   
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(50),
            ),
            padding: const EdgeInsets.all(10),
            child: const Center(
              child: Text('OOP',
              style: TextStyle(color: Colors.white, decoration: TextDecoration.none)
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.blue[300],
              borderRadius: BorderRadius.circular(50),
            ),
            padding: const EdgeInsets.all(10),
            child: const Center(
              child: Text('Dart',
              style: TextStyle(color: Colors.white, decoration: TextDecoration.none)
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue[300]!, Colors.blue[600]!]
                ),
              borderRadius: BorderRadius.circular(50),
            ),
            padding: const EdgeInsets.all(10),
            child: const Center(
              child: Text('Flutter',
              style: TextStyle(color: Colors.white, decoration: TextDecoration.none)
              ),
            ),
          ),
        ],
      )
    ),
  ),
  );
}
