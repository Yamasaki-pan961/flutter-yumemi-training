import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/feature/day_weather/presentation/presenter/day_weather_provider.dart';
import 'package:flutter_training/feature/day_weather/presentation/view/components/weather_info.dart';

class DayWeatherScreen extends ConsumerWidget {
  const DayWeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onClose() => Navigator.of(context).pop();
    void onReload() => ref.read(dayWeatherProvider.notifier).fetchWeather(
          (errorMessage) => showDialog<void>(
            context: context,
            builder: (context) => _FetchErrorDialog(errorMessage: errorMessage),
          ),
        );

    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: Column(
            children: [
              const Spacer(),
              const WeatherInfo(),
              Flexible(
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    Row(
                      children: [
                        Flexible(
                          child: Center(
                            child: TextButton(
                              onPressed: onClose,
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

class _FetchErrorDialog extends StatelessWidget {
  const _FetchErrorDialog({required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('天気取得エラー'),
      content: Text(errorMessage),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('OK'),
        )
      ],
    );
  }
}
