import 'package:flutter_training/common/models/weather_condition.dart';
import 'package:flutter_training/common/utils/extensions/enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';

/// Model class for weather information
@freezed
class Weather with _$Weather {
  factory Weather({
    required WeatherCondition weatherCondition,
    required int maxTemperature,
    required int minTemperature,
    required DateTime date,
  }) = _Weather;

  /// Create a [Weather] instance from Json data.
  ///
  /// The constructor requires the following Json data.
  /// ```dart
  /// const json = {
  ///    "weather_condition": "cloudy",
  ///    "max_temperature": 25,
  ///    "min_temperature": 7,
  ///    "date": "2020-04-01T12:00:00+09:00"
  /// }
  /// ```
  factory Weather.fromJson(Map<String, dynamic> json) {
    Never throwFormatException(String message) =>
        throw FormatException(message);

    final weatherCondition = WeatherCondition.values
        .byNameOrNull(json['weather_condition'].toString());
    if (weatherCondition == null) {
      throwFormatException(
        '''The value of "weather_condition" must be included in the enum [WeatherCondition].''',
      );
    }

    final maxTemperature = int.tryParse(json['max_temperature'].toString());
    if (maxTemperature == null) {
      throwFormatException(
        '''The "max_temperature" value must be numeric.''',
      );
    }

    final minTemperature = int.tryParse(json['min_temperature'].toString());
    if (minTemperature == null) {
      throwFormatException(
        '''The "min_temperature" value must be numeric.''',
      );
    }

    final date = DateTime.tryParse(json['date'].toString());
    if (date == null) {
      throwFormatException(
        '''The "date" value must be a string in ISO format.''',
      );
    }

    return Weather(
      weatherCondition: weatherCondition,
      maxTemperature: maxTemperature,
      minTemperature: minTemperature,
      date: date,
    );
  }
}
