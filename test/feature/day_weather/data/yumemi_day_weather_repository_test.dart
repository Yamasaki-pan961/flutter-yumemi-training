import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/common/domain/entities/weather.dart';
import 'package:flutter_training/common/utils/result.dart';
import 'package:flutter_training/feature/day_weather/data/yumemi_day_weather_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

@GenerateNiceMocks([
  MockSpec<YumemiWeather>(),
])
import 'yumemi_day_weather_repository_test.mocks.dart';

void main() {
  // Arrange
  final mockYumemiWeather = MockYumemiWeather();
  final repository = YumemiDayWeatherRepository(mockYumemiWeather);
  group(
    'YumemiDayWeatherRepository.fetch()',
    () {
      const keyWeatherCondition = 'weather_condition';
      const keyMaxTemperature = 'max_temperature';
      const keyMinTemperature = 'min_temperature';
      const keyDate = 'date';
      final date = DateTime(2022);
      final dateTextFormattedIso = date.toIso8601String();

      // 成功ケース
      group('Return success', () {
        test(
            'fetch() return Weather value contained in  Result.success '
            'when YumemiWeather return the correct Json.', () async {
          // Arrange
          when(
            mockYumemiWeather.syncFetchWeather(any),
          ).thenReturn(
            '''
{
  "$keyWeatherCondition":"cloudy",
  "$keyMaxTemperature":9223372036854775807,
  "$keyMinTemperature":-9223372036854775808,
  "$keyDate":"$dateTextFormattedIso"
}
''',
          );

          // Act
          final actual = await repository.fetch('', DateTime(2023));

          // Assert
          expect(
            actual,
            Result<Weather, String>.success(
              Weather(
                weatherCondition: WeatherCondition.cloudy,
                maxTemperature: 9223372036854775807,
                minTemperature: -9223372036854775808,
                date: date,
              ),
            ),
          );
        });
      });

      // 失敗ケース
      group('Return failure', () {
        group(
            'fetch() return incorrect data error text value '
            'contained in Result.failure '
            'when YumemiWeather return the incorrect Json.', () {
          const incorrectDataErrorText = '不適切なデータを取得しました';

          test('When Out of int range', () async {
            // Arrange
            when(
              mockYumemiWeather.syncFetchWeather(any),
            ).thenReturn(
              '''
{
  "$keyWeatherCondition":"cloudy",
  "$keyMaxTemperature":9223372036854775808,
  "$keyMinTemperature":0,
  "$keyDate":"$dateTextFormattedIso"
}
''',
            );

            // Act
            final actual = await repository.fetch('', DateTime(2023));

            // Assert
            expect(
              actual,
              const Result<Weather, String>.failure(incorrectDataErrorText),
            );
          });
          test('When unknown weather condition.', () async {
            // Arrange
            when(
              mockYumemiWeather.syncFetchWeather(any),
            ).thenReturn(
              // "arrow" is unknown weather condition
              '''
{
  "$keyWeatherCondition":"arrow",
  "$keyMaxTemperature":10,
  "$keyMinTemperature":0,
  "$keyDate":"$dateTextFormattedIso"
}
''',
            );

            // Act
            final actual = await repository.fetch('', DateTime(2023));

            // Assert
            expect(
              actual,
              const Result<Weather, String>.failure(incorrectDataErrorText),
            );
          });

          test('When max temperature is string', () async {
            // Arrange
            when(
              mockYumemiWeather.syncFetchWeather(any),
            ).thenReturn(
              '''
{
  "$keyWeatherCondition":"rainy",
  "$keyMaxTemperature":"10",
  "$keyMinTemperature":0,
  "$keyDate":"$dateTextFormattedIso"
}
''',
            );

            // Act
            final actual = await repository.fetch('', DateTime(2023));

            // Assert
            expect(
              actual,
              const Result<Weather, String>.failure(incorrectDataErrorText),
            );
          });

          test('When the date is not formatted', () async {
            const dateTextNotFormatted = '2023-5-22';
            // Arrange
            when(
              mockYumemiWeather.syncFetchWeather(any),
            ).thenReturn(
              '''
{
  "$keyWeatherCondition":"rainy",
  "$keyMaxTemperature":10,
  "$keyMinTemperature":0,
  "$keyDate":"$dateTextNotFormatted"
}
''',
            );

            // Act
            final actual = await repository.fetch('', DateTime(2023));

            // Assert
            expect(
              actual,
              const Result<Weather, String>.failure(incorrectDataErrorText),
            );
          });

          test('When missing a property', () async {
            // Arrange
            when(
              mockYumemiWeather.syncFetchWeather(any),
            ).thenReturn(
              '''
{
  "$keyWeatherCondition":"cloudy",
  "$keyMaxTemperature":10,
  "$keyDate":"$dateTextFormattedIso"
}
''',
            );

            // Act
            final actual = await repository.fetch('', DateTime(2023));

            // Assert
            expect(
              actual,
              const Result<Weather, String>.failure('不適切なデータを取得しました'),
            );
          });
        });
        test(
            'fetch() return invalid parameter error text value '
            'contained in Result.failure '
            'when YumemiWeather return '
            '"YumemiWeatherError.invalidParameter"', () async {
          // Arrange
          const invalidParameterText = 'パラメータが間違っています';
          when(mockYumemiWeather.syncFetchWeather(any))
              .thenThrow(YumemiWeatherError.invalidParameter);

          // Act
          final actual = await repository.fetch('', date);

          // Assert
          expect(
            actual,
            const Result<Weather, String>.failure(invalidParameterText),
          );
        });

        test(
          'fetch() return unknown error text value '
          'contained in Result.failure '
          'when YumemiWeather return "YumemiWeatherError.unknown"',
          () async {
            // Arrange
            const unknownError = '不明なエラーが発生しました';
            when(mockYumemiWeather.syncFetchWeather(any))
                .thenThrow(YumemiWeatherError.unknown);

            // Act
            final actual = await repository.fetch('', date);

            // Assert
            expect(
              actual,
              const Result<Weather, String>.failure(unknownError),
            );
          },
        );
      });
    },
  );
}
