import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_training/common/domain/entities/weather.dart';
import 'package:flutter_training/common/utils/api_call/dio_exception.dart';
import 'package:flutter_training/feature/day_weather/domain/repository/day_weather_repository.dart';
import 'package:simple_logger/simple_logger.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class YumemiDayWeatherRepository implements DayWeatherRepository {
  const YumemiDayWeatherRepository(this._yumemiWeather);
  final YumemiWeather _yumemiWeather;

  @override
  Future<Weather> fetch(String area, DateTime date) async {
    final payload = {'area': 'tokyo', 'date': date.toIso8601String()};
    final jsonPayload = jsonEncode(payload);

    return compute(
      (jsonPayload) {
        try {
          final response = _yumemiWeather.syncFetchWeather(jsonPayload);
          try {
            final json = jsonDecode(response) as Map<String, dynamic>;
            final weather = Weather.fromJson(json);
            return weather;
          } catch (_) {
            SimpleLogger().info('\nFetched Response: $response');
            throw DioException.badResponse;
          }
        } catch (error) {
          SimpleLogger().shout(error);
          switch (error) {
            case YumemiWeatherError.invalidParameter:
              throw DioException.badRequest;
            case YumemiWeatherError.unknown:
              throw DioException.unknown;
          }
          rethrow;
        }
      },
      jsonPayload,
    );
  }
}
