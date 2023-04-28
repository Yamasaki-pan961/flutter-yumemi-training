import 'package:flutter/material.dart';
import 'package:flutter_training/common/components/weather_icon.dart';
import 'package:flutter_training/common/models/weather.dart';
import 'package:flutter_training/feature/day_weather/components/temperature_text.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({
    required this.weather,
    super.key,
  });
  final Weather? weather;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: weather?.weatherCondition == null
              ? const Placeholder()
              : WeatherIcon(weatherCondition: weather!.weatherCondition),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Expanded(
              child: TemperatureText(
                temperature: weather?.minTemperature,
                type: TemperatureType.min,
              ),
            ),
            Expanded(
              child: TemperatureText(
                temperature: weather?.maxTemperature,
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
