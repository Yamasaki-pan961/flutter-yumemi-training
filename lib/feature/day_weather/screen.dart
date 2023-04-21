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
    _dayWeatherRepository.fetch().when(
          success: (value) => setState(() => _weatherType = value),
          failure: (value) {
            showDialog<void>(
              context: context,
              builder: (context) => _FetchErrorDialog(errorMessage: value),
            );
          },
        );
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
