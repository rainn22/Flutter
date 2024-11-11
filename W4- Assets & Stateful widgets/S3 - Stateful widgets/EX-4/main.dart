import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green[200],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScoreCard(title: 'My score in Flutter'),
              ScoreCard(title: 'My score in Dart'),
              ScoreCard(title: 'My score in React'),
            ],
          ),
        ),
      ),
    );
  }
}

class ScoreCard extends StatefulWidget {
  final String title;

  ScoreCard({required this.title});

  @override
  _ScoreCardState createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  int score = 5;

  void _increaseScore() {
    if (score < 10) {
      setState(() {
        score++;
      });
    }
  }

  void _decreaseScore() {
    if (score > 1) {
      setState(() {
        score--;
      });
    }
  }

  Color _getProgressColor() {
    if (score > 7) {
      return Colors.green[900]!;
    } else if (score < 3) {
      return Colors.green[300]!;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget.title, style: const TextStyle(fontSize: 24.0, color: Colors.grey, fontWeight: FontWeight.w800)),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: _decreaseScore,
                ),
                const SizedBox(width: 70.0),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _increaseScore,
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Stack(
                  children: [
                    Container(
                      width: 150.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.grey[200],
                      ),
                    ),
                    Container(
                      width: 15.0 * score,
                      height: 20.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: _getProgressColor(),
                      ),
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}