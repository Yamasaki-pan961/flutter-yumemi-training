import 'package:flutter/material.dart';
import 'package:flutter_training/common/models/weather_type.dart';
import 'package:flutter_training/feature/day_weather/components/weather_info.dart';
import 'package:flutter_training/feature/day_weather/repository.dart';

class DayWeatherScreen extends StatefulWidget {
  const DayWeatherScreen({super.key});

  @override
  State<DayWeatherScreen> createState() => _DayWeatherScreenState();
}

class _DayWeatherScreenState extends State<DayWeatherScreen> {
  final _dayWeatherRepository = DayWeatherRepository();
  WeatherType? _weatherType;
  void _onReload() {
    setState(() {
      _weatherType = _dayWeatherRepository.fetch();
    });
  }

  void _onClose() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
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
                              onPressed: _onClose,
                              child: const Text('Close'),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Center(
                            child: TextButton(
                              onPressed: _onReload,
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
