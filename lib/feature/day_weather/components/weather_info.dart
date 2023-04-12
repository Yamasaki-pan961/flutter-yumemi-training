import 'package:flutter/material.dart';
import 'package:flutter_training/feature/day_weather/components/temperature_text.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({
    required this.highTemperature,
    required this.lowTemperature,
    super.key,
  });
  final int? highTemperature;
  final int? lowTemperature;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AspectRatio(aspectRatio: 1, child: Placeholder()),
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
