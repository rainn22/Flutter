import 'package:first_project/W6-S1/EXERCISE-3/screen/temperature.dart';
import 'package:first_project/W6-S1/EXERCISE-3/screen/welcome.dart';
import 'package:flutter/material.dart';


class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  bool isWelcomeScreen = true;

  void toggleScreen() {
    setState(() {
      isWelcomeScreen = !isWelcomeScreen;
    });
  }
  
  @override
  Widget build(context) {

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff16C062),
                Color(0xff00BCDC),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: isWelcomeScreen
              ? Welcome(onStart: toggleScreen)
              : Temperature(),
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}
