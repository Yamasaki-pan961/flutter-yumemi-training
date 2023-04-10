import 'package:flutter/material.dart';
import 'package:flutter_training/feature/day_weather/components/weather_info.dart';

class DayWeatherScreen extends StatefulWidget {
  const DayWeatherScreen({super.key});

  @override
  State<DayWeatherScreen> createState() => _DayWeatherScreenState();
}

class _DayWeatherScreenState extends State<DayWeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: Column(
            children: const [
              Spacer(),
              WeatherInfo(lowTemperature: '** ℃',highTemperature: '** ℃',),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
