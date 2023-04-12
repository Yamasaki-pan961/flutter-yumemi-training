import 'package:flutter_training/common/utils/extensions/enum.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

enum WeatherType { sunny, rainy, cloudy }

class DayWeatherRepository {
  final _client = YumemiWeather();
  WeatherType? fetch() {
    final response = _client.fetchSimpleWeather();
    return WeatherType.values.byNameOrNull(response);
  }
}
