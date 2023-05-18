import 'dart:convert';

import 'package:flutter_training/common/domain/entities/weather.dart';
import 'package:flutter_training/common/utils/result.dart';
import 'package:flutter_training/feature/day_weather/domain/repository/day_weather_repository.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:simple_logger/simple_logger.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class YumemiDayWeatherRepository implements DayWeatherRepository {
  final _client = YumemiWeather();

  @override
  Result<Weather, String> fetch(String area, DateTime date) {
    final payload = {'area': 'tokyo', 'date': date.toIso8601String()};
    final jsonPayload = jsonEncode(payload);

    try {
      final response = _client.fetchWeather(jsonPayload);
      try {
        final json = jsonDecode(response) as Map<String, dynamic>;
        final weather = Weather.fromJson(json);
        return Result.success(weather);
      } on CheckedFromJsonException catch (error) {
        SimpleLogger().info('\nFetched Response: $response');
        SimpleLogger().shout(error);
        return const Result.failure('不適切なデータを取得しました');
      }
    } on YumemiWeatherError catch (error) {
      SimpleLogger().shout(error);
      switch (error) {
        case YumemiWeatherError.invalidParameter:
          return const Result.failure('パラメータが間違っています');
        case YumemiWeatherError.unknown:
          return const Result.failure('不明なエラーが発生しました');
      }
    }
  }
}
