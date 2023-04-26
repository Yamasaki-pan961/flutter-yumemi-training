import 'dart:convert';

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

  Result<Weather, String> fetch() {
    final fetchDate = DateTime.now();
    final payload = {'area': 'tokyo', 'date': fetchDate.toIso8601String()};
    final jsonPayload = jsonEncode(payload);

    try {
      final response = _client.fetchWeather(jsonPayload);
      final json = jsonDecode(response) as Map<String, dynamic>;
      final weather = Weather.fromJson(json);
      return Result.success(weather);
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
