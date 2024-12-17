import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/feature/day_weather/presentation/presenter/day_weather_provider.dart';
import 'package:flutter_training/feature/day_weather/presentation/view/components/weather_info.dart';

class DayWeatherScreen extends ConsumerWidget {
  const DayWeatherScreen({super.key});

  @visibleForTesting
  static final reloadButtonKey = UniqueKey();

  @visibleForTesting
  static final closeButtonKey = UniqueKey();

  @visibleForTesting
  static final loadingDialogKey = UniqueKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(dayWeatherApiCallStateProvider, (_, current) {
      current.whenOrNull(
        loading: (_) => showDialog<void>(
          barrierDismissible: false,
          context: context,
          builder: (context) => _LoadingDialog(
            key: loadingDialogKey,
          ),
        ),
        loaded: (result) {
          Navigator.of(context).pop();
          result.whenOrNull(
            failure: (errorMessage) => showDialog<void>(
              context: context,
              builder: (context) =>
                  _FetchErrorDialog(errorMessage: errorMessage),
            ),
          );
        },
      );
    });
    void onClose() => Navigator.of(context).pop();
    void onReload() =>
        ref.read(dayWeatherApiCallStateProvider.notifier).fetchWeather();

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
                              key: closeButtonKey,
                              onPressed: onClose,
                              child: const Text('Close'),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Center(
                            child: TextButton(
                              key: reloadButtonKey,
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

class _LoadingDialog extends StatelessWidget {
  const _LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const RepaintBoundary(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
