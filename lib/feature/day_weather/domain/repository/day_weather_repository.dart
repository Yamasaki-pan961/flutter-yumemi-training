import 'package:flutter_training/common/domain/entities/weather.dart';

abstract class DayWeatherRepository {
  /// A method to fetch the weather for the day.
  ///
  /// object representing either a success value of type
  /// [Weather] or a failure value of type [String]
  /// for a display text.
  Future<Weather> fetch(String area, DateTime date);
}
