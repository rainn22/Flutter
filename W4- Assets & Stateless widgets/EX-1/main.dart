import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('My Hobbies'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HobbyCard(
              icon: Icons.travel_explore,
              text: 'Travelling',
              backgroundColor: Colors.green,
            ),
            SizedBox(height: 10), // Space between cards
            HobbyCard(
              icon: Icons.skateboarding,
              text: 'Skating',
              backgroundColor: Colors.blueGrey,
            ),
          ],
        ),
      ),
    ),
  ));
}

class HobbyCard extends StatelessWidget {

  final IconData icon;
  final String text;
  final Color backgroundColor;

  const HobbyCard
({
    super.key,
    required this.icon,
    required this.text,
    this.backgroundColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
      child: Center(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Icon(icon, color: Colors.white,)),
            Text(
              text,
              style: const TextStyle(color: Colors.white,fontSize: 32 ,decoration: TextDecoration.none),
            ),
          ],
        ),
      ),
    );
  }
}




