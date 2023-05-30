import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

enum WeatherCondition { sunny, rainy, cloudy }

@freezed
class Weather with _$Weather {
  factory Weather({
    required WeatherCondition weatherCondition,
    required int maxTemperature,
    required int minTemperature,
    required DateTime date,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}
