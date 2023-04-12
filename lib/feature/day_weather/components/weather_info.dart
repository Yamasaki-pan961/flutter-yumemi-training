import 'package:flutter/material.dart';
import 'package:flutter_training/feature/day_weather/components/temperature_text.dart';
import 'package:flutter_training/feature/day_weather/components/weather_icon.dart';
import 'package:flutter_training/feature/day_weather/repository.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({
    required this.highTemperature,
    required this.lowTemperature,
    required this.weatherType,
    super.key,
  });
  final int? highTemperature;
  final int? lowTemperature;
  final WeatherType? weatherType;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
              aspectRatio: 1,
              child: weatherType == null
                  ? const Placeholder()
                  : WeatherIcon(weatherType: weatherType!),
            ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Expanded(
              child: TemperatureText(
                temperature: lowTemperature,
                type: TemperatureType.low,
              ),
            ),
            Expanded(
              child: TemperatureText(
                temperature: highTemperature,
                type: TemperatureType.high,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
