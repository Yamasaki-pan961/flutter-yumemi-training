 import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/common/domain/entities/weather.dart';
import 'package:flutter_training/common/utils/result.dart';
import 'package:flutter_training/feature/day_weather/domain/use_case/fetch_day_weather_use_case.dart';
import 'package:flutter_training/feature/day_weather/presentation/presenter/day_weather_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'day_weather_provider_test.mocks.dart';

class Listener<T> extends Mock {
  void call(T? previous, T value);
}

class TestDayWetherNotifier extends DayWeather {
  TestDayWetherNotifier(this._initialValue);

  final Weather? _initialValue;
  @override
  Weather? build() => _initialValue;
}

/// Initialize and hold Riverpod containers and listeners
class RiverpodTestTools {
  RiverpodTestTools({
    required FetchDayWeatherUseCase useCaseMock,
    Weather? initialWeather,
  }) : container = ProviderContainer(
          overrides: [
            fetchDayWeatherUseCaseProvider.overrideWithValue(useCaseMock),
            dayWeatherProvider
                .overrideWith(() => TestDayWetherNotifier(initialWeather))
          ],
        ) {
    addTearDown(container.dispose);

    container.listen<Weather?>(
      dayWeatherProvider,
      listener,
    );
  }

  final ProviderContainer container;
  final listener = Listener<Weather?>();
}

@GenerateNiceMocks([
  MockSpec<FetchDayWeatherUseCase>(),
])
void main() {
  group(
    'Test the number of calls to '
    'dayWeatherProvider.fetchWeather() and use case',
    () {
      // Arrange
      final resultForMatcher = Result<Weather, String>.success(
        Weather(
          weatherCondition: WeatherCondition.rainy,
          maxTemperature: 20,
          minTemperature: 10,
          date: DateTime(2023),
        ),
      );
      final useCaseMock = MockFetchDayWeatherUseCase();
      when(useCaseMock.call()).thenReturn(resultForMatcher);

      test('0 calls to use case when 0 calls to fetchWeather()', () {
        // Arrange
        final riverpodTestTool = RiverpodTestTools(useCaseMock: useCaseMock);

        // Act
        // 0 calls to fetch()

        // Assert
        verifyNever(
          useCaseMock.call(),
        );
      });

      test(
        '1 calls to use case when 1 calls to fetchWeather()',
        () {
          // Arrange
          final riverpodTestTool = RiverpodTestTools(useCaseMock: useCaseMock);

          // Act
          riverpodTestTool.container
              .read(dayWeatherProvider.notifier)
              .fetchWeather();

          // Assert
          verify(useCaseMock.call()).called(1);
        },
      );

      test(
        '2 calls to use case when 2 calls to fetchWeather()',
        () {
          // Arrange
          final riverpodTestTool = RiverpodTestTools(useCaseMock: useCaseMock);

          // Act
          riverpodTestTool.container
              .read(dayWeatherProvider.notifier)
              .fetchWeather();
          riverpodTestTool.container
              .read(dayWeatherProvider.notifier)
              .fetchWeather();

          // Assert
          verify(useCaseMock.call()).called(2);
        },
      );
    },
  );

  group('Test dayWeatherProvider state', () {
    // Arrange
    final useCaseMock = MockFetchDayWeatherUseCase();
    test('Default state is null', () {
      // Arrange
      final riverpodTestTools = RiverpodTestTools(useCaseMock: useCaseMock);

      // Act
      final actual = riverpodTestTools.container.read(dayWeatherProvider);

      // Assert
      expect(actual, null);
    });

    test(
        'The first time fetchWeather() returns success, '
        'the state changes from null to Weather', () {
      // Arrange
      final riverpodTestTools = RiverpodTestTools(useCaseMock: useCaseMock);
      final weather = Weather(
        weatherCondition: WeatherCondition.rainy,
        maxTemperature: 20,
        minTemperature: 10,
        date: DateTime(2023),
      );
      final result = Result<Weather, String>.success(
        weather,
      );
      when(useCaseMock.call()).thenReturn(result);

      // Act
      riverpodTestTools.container
          .read(dayWeatherProvider.notifier)
          .fetchWeather();

      // Assert
      verify(riverpodTestTools.listener(null, weather)).called(1);
    });

    test(
        'When fetchWeather() returns failure,'
        ' state changes from Weather to null', () {
      // Arrange
      final weather = Weather(
        weatherCondition: WeatherCondition.rainy,
        maxTemperature: 20,
        minTemperature: 10,
        date: DateTime(2023),
      );

      final riverpodTestTools = RiverpodTestTools(
        useCaseMock: useCaseMock,
        initialWeather: weather,
      );

      const resultFailure = Result<Weather, String>.failure('');
      when(useCaseMock.call()).thenReturn(resultFailure);

      // Act
      riverpodTestTools.container
          .read(dayWeatherProvider.notifier)
          .fetchWeather();

      // Assert
      verify(riverpodTestTools.listener(weather, null)).called(1);
    });
  });
}
