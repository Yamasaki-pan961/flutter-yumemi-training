import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/common/utils/api_call/dio_exception.dart';
import 'package:flutter_training/feature/day_weather/presentation/presenter/day_weather_provider.dart';
import 'package:flutter_training/feature/day_weather/presentation/view/components/weather_info.dart';

class DayWeatherScreen extends ConsumerWidget {
  const DayWeatherScreen({super.key});

  @visibleForTesting
  static final reloadButtonKey = UniqueKey();

  @visibleForTesting
  static final closeButtonKey = UniqueKey();

  @visibleForTesting
  static final loadingSpinnerKey = UniqueKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(dayWeatherProvider, (_, current) {
      if (current.isLoading) {
        showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (context) => _LoadingDialog(key: loadingSpinnerKey));
      }
    });

    void onClose() => Navigator.of(context).pop();
    void onReload() => ref.read(dayWeatherProvider.notifier).fetchWeather();

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
  const _FetchErrorDialog({required this.error});
  final Object error;
  @override
  Widget build(BuildContext context) {
    final errorMessage = error is DioException
        ? getDioExceptionMessage(error as DioException)
        : '不明なアプリケーションエラーが発生しました';
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

class _LoadingDialog extends ConsumerWidget {
  const _LoadingDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(dayWeatherProvider, (_, current) {
      print(current);
      if (!current.isLoading) {
        Navigator.of(context).pop();
      }
      current.maybeWhen(
        error: (asyncError, __) {
          showDialog<void>(
            context: context,
            builder: (context) => _FetchErrorDialog(
              error: asyncError,
            ),
          );
        },
        orElse: () {},
      );
    });
    return Center(
      child: const CircularProgressIndicator(),
    );
  }
}
