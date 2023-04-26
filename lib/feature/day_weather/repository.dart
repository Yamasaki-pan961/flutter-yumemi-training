import 'package:flutter_training/common/models/result.dart';
import 'package:flutter_training/common/models/weather_condition.dart';
import 'package:flutter_training/common/utils/extensions/enum.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class DayWeatherRepository {
  final _client = YumemiWeather();

  /// A method to fetch the weather for the day.
  ///
  /// Fetches the weather data from API and returns a [Result]
  /// object representing either a success value of type
  /// [WeatherCondition] or a failure value of type [String]
  /// for a display text.

  Result<WeatherCondition, String> fetch() {
    try {
      final response = _client.fetchThrowsWeather('tokyo');
      final weatherType = WeatherType.values.byNameOrNull(response);
      final weatherCondition = WeatherCondition.values.byNameOrNull(response);
      if (weatherCondition == null) {
        return const Result.failure('不明な天気を取得しました');
      }
      return Result.success(weatherCondition);
    } on YumemiWeatherError catch (error) {
      switch (error) {
        case YumemiWeatherError.invalidParameter:
          return const Result.failure('パラメータが間違っています');
        case YumemiWeatherError.unknown:
          return const Result.failure('不明なエラーが発生しました');
      }
    }
  }
}
