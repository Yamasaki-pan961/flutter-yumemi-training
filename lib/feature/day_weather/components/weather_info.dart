import 'package:flutter/material.dart';
import 'package:flutter_training/common/components/weather_icon.dart';
import 'package:flutter_training/common/models/weather_condition.dart';
import 'package:flutter_training/feature/day_weather/components/temperature_text.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({
    required this.highTemperature,
    required this.lowTemperature,
    required this.weatherCondition,
    super.key,
  });
  final int? highTemperature;
  final int? lowTemperature;
  final WeatherCondition? weatherCondition;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: weatherCondition == null
              ? const Placeholder()
              : WeatherIcon(weatherCondition: weatherCondition!),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Expanded(
              child: TemperatureText(
                temperature: lowTemperature,
                type: TemperatureType.min,
              ),
            ),
            Expanded(
              child: TemperatureText(
                temperature: highTemperature,
                type: TemperatureType.max,
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
