import 'package:flutter_training/common/models/result.dart';
import 'package:flutter_training/common/models/weather_type.dart';
import 'package:flutter_training/common/utils/extensions/enum.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class DayWeatherRepository {
  final _client = YumemiWeather();
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
