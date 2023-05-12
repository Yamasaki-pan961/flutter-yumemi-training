import 'package:flutter_training/common/domain/entities/weather.dart';
import 'package:flutter_training/common/utils/result.dart';

abstract class DayWeatherRepository {
  /// A method to fetch the weather for the day.
  ///
  /// Fetches the weather data from API and returns a [Result]
  /// object representing either a success value of type
  /// [Weather] or a failure value of type [String]
  /// for a display text.
  Result<Weather, String> fetch(String area, DateTime date);
}
