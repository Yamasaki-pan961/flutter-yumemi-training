import 'package:flutter_training/common/domain/entities/weather.dart';
import 'package:flutter_training/common/utils/result.dart';
import 'package:flutter_training/feature/day_weather/domain/repository/day_weather_repository.dart';

class FetchDayWeatherUseCase {
  const FetchDayWeatherUseCase(this._repository);
  final DayWeatherRepository _repository;

  Future<Result<Weather, String>> call() {
    const area = 'tokyo';
    final date = DateTime.now();
    return _repository.fetch(area, date);
  }
}
