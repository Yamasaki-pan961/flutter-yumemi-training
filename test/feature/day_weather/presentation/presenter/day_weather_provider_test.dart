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

/// Initialize and hold Riverpod containers and listeners
class RiverpodTestTools {
  RiverpodTestTools({required FetchDayWeatherUseCase useCaseMock})
      : container = ProviderContainer(
          overrides: [
            fetchDayWeatherUseCaseProvider.overrideWithValue(useCaseMock)
          ],
        ) {
    addTearDown(container.dispose);

    container.listen<Weather?>(dayWeatherProvider, listener);
  }

  final ProviderContainer container;
  final listener = Listener<Weather?>();
}

@GenerateMocks([FetchDayWeatherUseCase])
void main() {
  group(
    'Test the number of calls to fetch() and use case',
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
      when(useCaseMock()).thenReturn(resultForMatcher);

      test('0 calls to use case when 0 calls to fetch()', () {
        // Arrange
        final riverpodTestTool = RiverpodTestTools(useCaseMock: useCaseMock);

        // Act
        // 0 calls to fetch()

        // Assert
        verifyNever(
          riverpodTestTool.container
              .read(fetchDayWeatherUseCaseProvider)
              .call(),
        );
      });

      test(
        '1 calls to use case when 1 calls to fetch()',
        () {
          // Arrange
          final riverpodTestTool = RiverpodTestTools(useCaseMock: useCaseMock);

          // Act
          riverpodTestTool.container
              .read(dayWeatherProvider.notifier)
              .fetchWeather();

          // Assert
          verify(
            riverpodTestTool.container
                .read(fetchDayWeatherUseCaseProvider)
                .call(),
          ).called(1);
        },
      );

      test(
        '2 calls to use case when 2 calls to fetch()',
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
          verify(useCaseMock()).called(2);
        },
      );
    },
  );
}
