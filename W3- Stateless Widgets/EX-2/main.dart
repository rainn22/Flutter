import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
    home: Container(
      decoration: BoxDecoration(
          color: Colors.blue[300],
      ),
      padding: const EdgeInsets.all(50),
      margin: const EdgeInsets.all(40), 
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[600],
          borderRadius: BorderRadius.circular(5)
        ),
        child: const Center(
          child: Text('CADT Student',
            style: TextStyle(color: Colors.white, decoration: TextDecoration.none),
          ),
        ),
      ),
    ),
  ));
}
