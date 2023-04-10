import 'package:flutter/material.dart';
import 'package:flutter_training/feature/day_weather/components/temperature_text.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({
    required this.highTemperature,
    required this.lowTemperature,
    super.key,
  });
  final String highTemperature;
  final String lowTemperature;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            const AspectRatio(aspectRatio: 1, child: Placeholder()),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: TemperatureText(
                    lowTemperature,
                    type: TemperatureType.low,
                  ),
                ),
                Expanded(
                  child: TemperatureText(
                    highTemperature,
                    type: TemperatureType.high,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ],
    );
  }
}
