import 'package:flutter_training/common/domain/entities/weather.dart';
import 'package:flutter_training/feature/day_weather/data/yumemi_day_weather_repository.dart';
import 'package:flutter_training/feature/day_weather/domain/repository/day_weather_repository.dart';
import 'package:flutter_training/feature/day_weather/domain/use_case/fetch_day_weather_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

part 'day_weather_provider.g.dart';

@Riverpod(keepAlive: true)
DayWeatherRepository dayWeatherRepository(DayWeatherRepositoryRef ref) =>
    YumemiDayWeatherRepository(YumemiWeather());

@Riverpod(keepAlive: true)
FetchDayWeatherUseCase fetchDayWeatherUseCase(FetchDayWeatherUseCaseRef ref) =>
    FetchDayWeatherUseCase(ref.watch(dayWeatherRepositoryProvider));

@riverpod
class DayWeather extends _$DayWeather {
  @override
  Future<Weather?> build() => Future.value();

  Future<void> fetchWeather({
    void Function(String errorMessage)? onError,
  }) async {
    state = const AsyncLoading<Weather?>().copyWithPrevious(state);
    state = AsyncData(
      (await ref.read(fetchDayWeatherUseCaseProvider).call()).when(
        success: (weather) => weather,
        failure: (errorMessage) {
          onError?.call(errorMessage);
          return null;
        },
      ),
    );
  }
}
