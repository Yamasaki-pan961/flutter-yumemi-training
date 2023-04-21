import 'package:flutter_training/common/models/result.dart';
import 'package:flutter_training/common/models/weather_type.dart';
import 'package:flutter_training/common/utils/extensions/enum.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class DayWeatherRepository {
  final _client = YumemiWeather();

  /// A method to fetch the weather for the day.
  ///
  /// Fetches the weather data from API and returns a [Result]
  /// object representing either a success value of type
  /// [WeatherType] or a failure value of type [String]
  /// for a display text.

  Result<WeatherType, String> fetch() {
    try {
      final response = _client.fetchThrowsWeather('tokyo');
      final weatherType = WeatherType.values.byNameOrNull(response);
      if (weatherType == null) {
        return const Result.failure('不明な天気を取得しました');
      }
      return Result.success(weatherType);
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
