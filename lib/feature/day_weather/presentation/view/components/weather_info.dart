import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/common/presentation/view/components/weather_icon.dart';
import 'package:flutter_training/feature/day_weather/presentation/presenter/day_weather_provider.dart';
import 'package:flutter_training/feature/day_weather/presentation/view/components/temperature_text.dart';

class WeatherInfo extends ConsumerWidget {
  const WeatherInfo({super.key});

  @visibleForTesting
  static final maxTemperatureKey = UniqueKey();

  @visibleForTesting
  static final minTemperatureKey = UniqueKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weather = ref.watch(dayWeatherProvider);
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
                key: minTemperatureKey,
                temperature: weather?.minTemperature,
                type: TemperatureType.min,
              ),
            ),
            Expanded(
              child: TemperatureText(
                key: maxTemperatureKey,
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
