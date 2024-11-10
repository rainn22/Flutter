import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Weather Forecast'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView( // Allows horizontal scrolling
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              WeatherForecast(
                condition: WeatherCondition.sunny,
                minTemp: 15,
                maxTemp: 25,
                dayOfWeek: DayOfWeek.mon,
              ),
              WeatherForecast(
                condition: WeatherCondition.rainy,
                minTemp: 10,
                maxTemp: 20,
                dayOfWeek: DayOfWeek.tue,
              ),
              WeatherForecast(
                condition: WeatherCondition.cloudy,
                minTemp: 12,
                maxTemp: 22,
                dayOfWeek: DayOfWeek.wed,
              ),
              WeatherForecast(
                condition: WeatherCondition.snowy,
                minTemp: -5,
                maxTemp: 0,
                dayOfWeek: DayOfWeek.thu,
              ),
              WeatherForecast(
                condition: WeatherCondition.rainy,
                minTemp: 10,
                maxTemp: 20,
                dayOfWeek: DayOfWeek.fri,
              ),
              WeatherForecast(
                condition: WeatherCondition.cloudy,
                minTemp: 12,
                maxTemp: 22,
                dayOfWeek: DayOfWeek.sat,
              ),
              WeatherForecast(
                condition: WeatherCondition.snowy,
                minTemp: -5,
                maxTemp: 0,
                dayOfWeek: DayOfWeek.sun,
              ),
              WeatherForecast(
                condition: WeatherCondition.sunny,
                minTemp: 15,
                maxTemp: 25,
                dayOfWeek: DayOfWeek.mon,
              ),
              WeatherForecast(
                condition: WeatherCondition.rainy,
                minTemp: 10,
                maxTemp: 20,
                dayOfWeek: DayOfWeek.tue,
              ),
              WeatherForecast(
                condition: WeatherCondition.cloudy,
                minTemp: 12,
                maxTemp: 22,
                dayOfWeek: DayOfWeek.wed,
              ),
              WeatherForecast(
                condition: WeatherCondition.snowy,
                minTemp: -5,
                maxTemp: 0,
                dayOfWeek: DayOfWeek.thu,
              ),
              WeatherForecast(
                condition: WeatherCondition.rainy,
                minTemp: 10,
                maxTemp: 20,
                dayOfWeek: DayOfWeek.fri,
              ),
              WeatherForecast(
                condition: WeatherCondition.cloudy,
                minTemp: 12,
                maxTemp: 22,
                dayOfWeek: DayOfWeek.sat,
              ),
              WeatherForecast(
                condition: WeatherCondition.snowy,
                minTemp: -5,
                maxTemp: 0,
                dayOfWeek: DayOfWeek.sun,
              ),
            ],
          ),
        ),
      ),
    ),
  ));
}

enum WeatherCondition {
  sunny(icon: Icons.sunny, backgroundColor: Colors.yellow),
  rainy(icon: Icons.beach_access_rounded, backgroundColor: Colors.blue),
  cloudy(icon: Icons.cloud_rounded, backgroundColor: Colors.grey),
  snowy(icon: Icons.ac_unit, backgroundColor: Colors.blueGrey);

  final IconData icon;
  final Color backgroundColor;

  const WeatherCondition({
    required this.icon,
    required this.backgroundColor,
  });
}

enum DayOfWeek {
  mon('Monday'),
  tue('Tuesday'),
  wed('Wednesday'),
  thu('Thursday'),
  fri('Friday'),
  sat('Saturday'),
  sun('Sunday');

  final String label;

  const DayOfWeek(this.label);
}

class WeatherForecast extends StatelessWidget {
  final WeatherCondition condition;
  final int minTemp;
  final int maxTemp;
  final DayOfWeek dayOfWeek;

  const WeatherForecast({
    super.key,
    required this.condition,
    required this.minTemp,
    required this.maxTemp,
    required this.dayOfWeek,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 160,
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.symmetric(horizontal: 5.0), 
      decoration: BoxDecoration(
        color: condition.backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            dayOfWeek.label,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Icon(condition.icon, size: 48),
          Text('Min: $minTemp°C'),
          Text('Max: $maxTemp°C'),
        ],
      ),
    );
  }
}
