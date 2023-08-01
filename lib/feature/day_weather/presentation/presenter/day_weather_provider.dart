import 'package:flutter_training/common/domain/entities/weather.dart';
import 'package:flutter_training/common/utils/api_call_status.dart';
import 'package:flutter_training/common/utils/result.dart';
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
ApiCallStatus<Result<Weather, String>> dayWeatherApiCallInitialValue(
  DayWeatherApiCallInitialValueRef ref,
) =>
    const ApiCallStatus<Result<Weather, String>>.notLoaded();

@riverpod
class DayWeatherApiCallState extends _$DayWeatherApiCallState {
  @override
  ApiCallStatus<Result<Weather, String>> build() =>
      ref.watch(dayWeatherApiCallInitialValueProvider);

  Future<void> fetchWeather() async {
    if (state.isLoading) {
      return;
    }
    state = ApiCallStatus.loading(state.valueOrNull);
    state = ApiCallStatus.loaded(
      await ref.read(fetchDayWeatherUseCaseProvider).call(),
    );
  }
}

@riverpod
Weather? dayWeather(DayWeatherRef ref) =>
    ref.watch(dayWeatherApiCallStateProvider).valueOrNull?.whenOrNull(
          success: (weather) => weather,
        );
