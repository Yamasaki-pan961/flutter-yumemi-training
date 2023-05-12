import 'package:flutter/material.dart';
import 'package:flutter_training/common/domain/entities/weather.dart';
import 'package:flutter_training/feature/day_weather/data/yumemi_day_weather_repository.dart';
import 'package:flutter_training/feature/day_weather/domain/use_case/fetch_day_weather_use_case.dart';
import 'package:flutter_training/feature/day_weather/presentation/view/components/weather_info.dart';

class DayWeatherScreen extends StatefulWidget {
  const DayWeatherScreen({super.key});

  @override
  State<DayWeatherScreen> createState() => _DayWeatherScreenState();
}

class _DayWeatherScreenState extends State<DayWeatherScreen> {
  final _fetchDayWeather = FetchDayWeatherUseCase(YumemiDayWeatherRepository());
  Weather? _weather;
  void _onReload() {
    _fetchDayWeather().when(
      success: (value) => setState(() => _weather = value),
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
                weather: _weather,
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
