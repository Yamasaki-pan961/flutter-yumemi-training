import 'package:flutter/material.dart';
import 'package:flutter_training/feature/day_weather/components/weather_info.dart';
import 'package:flutter_training/feature/day_weather/repository.dart';

final dayWeatherRepository = DayWeatherRepository();

class DayWeatherScreen extends StatefulWidget {
  const DayWeatherScreen({super.key});

  @override
  State<DayWeatherScreen> createState() => _DayWeatherScreenState();
}

class _DayWeatherScreenState extends State<DayWeatherScreen> {
  WeatherType? _weatherType;

  @override
  Widget build(BuildContext context) {
    void onReload() {
      setState(() {
        _weatherType = dayWeatherRepository.fetch();
      });
    }

    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: Column(
            children: [
              const Spacer(),
              WeatherInfo(
                lowTemperature: null,
                highTemperature: null,
                weatherType: _weatherType,
              ),
              Flexible(
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    Row(
                      children: [
                        Flexible(
                          child: Center(
                            child: TextButton(
                              onPressed: () {},
                              child: const Text('Close'),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Center(
                            child: TextButton(
                              onPressed: onReload,
                              child: const Text('Reload'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
