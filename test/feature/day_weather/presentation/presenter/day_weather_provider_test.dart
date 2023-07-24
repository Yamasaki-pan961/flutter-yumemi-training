import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/common/domain/entities/weather.dart';
import 'package:flutter_training/common/utils/api_call/dio_exception.dart';
import 'package:flutter_training/feature/day_weather/domain/use_case/fetch_day_weather_use_case.dart';
import 'package:flutter_training/feature/day_weather/presentation/presenter/day_weather_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'day_weather_provider_test.mocks.dart';

class Listener<T> extends Mock {
  void call(T? previous, T? value);
}

/// Initialize and hold Riverpod containers and listeners
class RiverpodTestTools {
  RiverpodTestTools({
    required FetchDayWeatherUseCase useCaseMock,
  }) : container = ProviderContainer(
          overrides: [
            fetchDayWeatherUseCaseProvider.overrideWithValue(useCaseMock),
          ],
        ) {
    addTearDown(container.dispose);

    container.listen<AsyncValue<Weather?>>(
      dayWeatherProvider,
      listener,
      fireImmediately: true,
    );
  }

  final ProviderContainer container;
  final listener = Listener<AsyncValue<Weather?>>();
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
      final weather = Weather(
        weatherCondition: WeatherCondition.rainy,
        maxTemperature: 20,
        minTemperature: 10,
        date: DateTime(2023),
      );
      final useCaseMock = MockFetchDayWeatherUseCase();
      when(useCaseMock.call()).thenAnswer((_) async => weather);

      test('0 calls to use case when 0 calls to fetchWeather()', () async {
        // Arrange
        final riverpodTestTool = RiverpodTestTools(useCaseMock: useCaseMock);

        // Act
        // 0 calls to fetch()
        await riverpodTestTool.container
            .read(dayWeatherProvider.notifier)
            .future;

        // Assert
        verifyNever(
          useCaseMock.call(),
        );
      });

      test(
        '1 calls to use case when 1 calls to fetchWeather()',
        () async {
          // Arrange
          final riverpodTestTool = RiverpodTestTools(useCaseMock: useCaseMock);

          // Act
          await riverpodTestTool.container
              .read(dayWeatherProvider.notifier)
              .future;
          await riverpodTestTool.container
              .read(dayWeatherProvider.notifier)
              .fetchWeather();

          // Assert
          verify(useCaseMock.call()).called(1);
        },
      );

      test(
        '2 calls to use case when 2 calls to fetchWeather()',
        () async {
          // Arrange
          final riverpodTestTool = RiverpodTestTools(useCaseMock: useCaseMock);

          // Act
          await riverpodTestTool.container
              .read(dayWeatherProvider.notifier)
              .future;
          await riverpodTestTool.container
              .read(dayWeatherProvider.notifier)
              .fetchWeather();
          await riverpodTestTool.container
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
    test('Default state is Async.value(null) after initialization', () async {
      // Arrange
      final riverpodTestTools = RiverpodTestTools(
        useCaseMock: useCaseMock,
      );

      // Act
      await riverpodTestTools.container
          .read(dayWeatherProvider.notifier)
          .future; // 初期化の終了を待つ
      final actual = riverpodTestTools.container.read(dayWeatherProvider);

      // Assert
      expect(actual, const AsyncValue<Weather?>.data(null));
    });

    test(
        'The first time fetchWeather() returns success, '
        'the state changes in order '
        'null(default) to loading to weather', () async {
      // Arrange
      final riverpodTestTools = RiverpodTestTools(
        useCaseMock: useCaseMock,
      );
      final weather = Weather(
        weatherCondition: WeatherCondition.rainy,
        maxTemperature: 20,
        minTemperature: 10,
        date: DateTime(2023),
      );

      when(useCaseMock.call()).thenAnswer((_) async => weather);

      // Act
      await riverpodTestTools.container
          .read(dayWeatherProvider.notifier)
          .future;

      await riverpodTestTools.container
          .read(dayWeatherProvider.notifier)
          .fetchWeather();

      // Assert
      verifyInOrder([
        riverpodTestTools.listener(
          any,
          const AsyncValue<Weather?>.data(null),
        ),
        riverpodTestTools.listener(
          any,
          const AsyncValue<Weather?>.loading().copyWithPrevious(
            const AsyncValue<Weather?>.data(null),
          ),
        ),
        riverpodTestTools.listener(
          any,
          AsyncValue<Weather?>.data(weather),
        ),
      ]);
    });

    test(
        'When fetchWeather() returns failure after  , '
        'the state changes in order '
        'weather to loading to AsyncError', () async {
      // Arrange
      final weather = Weather(
        weatherCondition: WeatherCondition.rainy,
        maxTemperature: 20,
        minTemperature: 10,
        date: DateTime(2023),
      );

      final riverpodTestTools = RiverpodTestTools(
        useCaseMock: useCaseMock,
      );
      // Act
      // Set success answer
      await riverpodTestTools.container
          .read(dayWeatherProvider.notifier)
          .future;
      when(useCaseMock.call()).thenAnswer((_) async => weather);
      await riverpodTestTools.container
          .read(dayWeatherProvider.notifier)
          .fetchWeather();

      // set exception answer
      when(useCaseMock.call()).thenThrow(DioException.unknown);
      await riverpodTestTools.container
          .read(dayWeatherProvider.notifier)
          .fetchWeather();

      final error =
          riverpodTestTools.container.read(dayWeatherProvider).asError;

      // Assert
      verifyInOrder([
        riverpodTestTools.listener(
          any,
          AsyncValue<Weather?>.data(weather),
        ),
        riverpodTestTools.listener(
          any,
          const AsyncValue<Weather?>.loading().copyWithPrevious(
            AsyncValue<Weather?>.data(weather),
          ),
        ),
        riverpodTestTools.listener(
          any,
          argThat(isA<AsyncError<Weather?>>()),
        ),
      ]);
      expect(error!.error, DioException.unknown);
    });
  });
}
