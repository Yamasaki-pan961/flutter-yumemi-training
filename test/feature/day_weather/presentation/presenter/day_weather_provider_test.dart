import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/common/domain/entities/weather.dart';
import 'package:flutter_training/common/utils/api_call_status.dart';
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
  RiverpodTestTools({
    required FetchDayWeatherUseCase useCaseMock,
  }) : container = ProviderContainer(
          overrides: [
            fetchDayWeatherUseCaseProvider.overrideWithValue(useCaseMock),
          ],
        ) {
    addTearDown(container.dispose);

    container.listen<ApiCallStatus<Result<Weather, String>>>(
      dayWeatherApiCallStateProvider,
      listener,
    );
  }

  final ProviderContainer container;
  final listener = Listener<ApiCallStatus<Result<Weather, String>>>();
}

@GenerateNiceMocks([
  MockSpec<FetchDayWeatherUseCase>(),
])
void main() {
  group(
    'Test the number of calls to '
    'dayWeatherApiCallStateProvider.fetchWeather() and use case',
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
      when(useCaseMock.call()).thenAnswer((_) async => resultForMatcher);

      test('0 calls to use case when 0 calls to fetchWeather()', () {
        // Arrange
        RiverpodTestTools(useCaseMock: useCaseMock);

        // Act
        // 0 calls to fetch()

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
              .read(dayWeatherApiCallStateProvider.notifier)
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
              .read(dayWeatherApiCallStateProvider.notifier)
              .fetchWeather();
          await riverpodTestTool.container
              .read(dayWeatherApiCallStateProvider.notifier)
              .fetchWeather();

          // Assert
          verify(useCaseMock.call()).called(2);
        },
      );
    },
  );

  group('Test dayWeatherApiCallState', () {
    final useCaseMock = MockFetchDayWeatherUseCase();
    final weather = Weather(
      weatherCondition: WeatherCondition.rainy,
      maxTemperature: 20,
      minTemperature: 10,
      date: DateTime(2023),
    );
    test(
        'When fetchWeather() returns success after, '
        'the state changes in order '
        'notLoaded to loading to loaded', () async {
      // Arrange
      final riverpodTestTools = RiverpodTestTools(useCaseMock: useCaseMock);
      final successResult = Result<Weather, String>.success(weather);
      when(useCaseMock.call()).thenAnswer((_) async => successResult);

      // Action
      await riverpodTestTools.container
          .read(dayWeatherApiCallStateProvider.notifier)
          .fetchWeather();

      // Expectation
      verifyInOrder([
        riverpodTestTools.listener(
          const ApiCallStatus.notLoaded(),
          const ApiCallStatus.loading(null),
        ),
        riverpodTestTools.listener(
          any,
          ApiCallStatus<Result<Weather, String>>.loaded(successResult),
        ),
      ]);
    });
    test(
        'When fetchWeather() returns failure after, '
        'the state changes in order '
        'notLoaded to loading to loaded', () async {
      // Arrange
      final riverpodTestTools = RiverpodTestTools(useCaseMock: useCaseMock);
      const failureResult = Result<Weather, String>.failure('');
      when(useCaseMock.call()).thenAnswer((_) async => failureResult);

      // Action
      await riverpodTestTools.container
          .read(dayWeatherApiCallStateProvider.notifier)
          .fetchWeather();

      // Expectation
      verifyInOrder([
        riverpodTestTools.listener(
          const ApiCallStatus.notLoaded(),
          const ApiCallStatus.loading(null),
        ),
        riverpodTestTools.listener(
          any,
          const ApiCallStatus<Result<Weather, String>>.loaded(failureResult),
        ),
      ]);
    });
  });

  group('Test dayWeatherProvider state', () {
    // Arrange
    final useCaseMock = MockFetchDayWeatherUseCase();
    final weather = Weather(
      weatherCondition: WeatherCondition.rainy,
      maxTemperature: 20,
      minTemperature: 10,
      date: DateTime(2023),
    );
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
        'the state is Weather', () async {
      // Arrange
      final riverpodTestTools = RiverpodTestTools(useCaseMock: useCaseMock);

      final result = Result<Weather, String>.success(weather);
      when(useCaseMock.call()).thenAnswer((_) async => result);

      // Act
      await riverpodTestTools.container
          .read(dayWeatherApiCallStateProvider.notifier)
          .fetchWeather();

      final actual = riverpodTestTools.container.read(dayWeatherProvider);

      // Assert
      expect(actual, weather);
    });

    test(
        'When fetchWeather() returns failure, '
        'state is null', () async {
      // Arrange

      final riverpodTestTools = RiverpodTestTools(
        useCaseMock: useCaseMock,
      );

      const resultFailure = Result<Weather, String>.failure('');
      when(useCaseMock.call()).thenAnswer((_) async => resultFailure);

      // Act
      await riverpodTestTools.container
          .read(dayWeatherApiCallStateProvider.notifier)
          .fetchWeather();

      final actual = riverpodTestTools.container.read(dayWeatherProvider);

      // Assert
      expect(actual, null);
    });

    test('State retains previous value during loading', () async {
      // Arrange
      final riverpodTestTools = RiverpodTestTools(
        useCaseMock: useCaseMock,
      );
      final fetchCompleter = Completer<Result<Weather, String>>();

      // 初期値を変更
      final resultSuccess = Result<Weather, String>.success(weather);
      when(useCaseMock.call()).thenAnswer((_) async => resultSuccess);
      await riverpodTestTools.container
          .read(dayWeatherApiCallStateProvider.notifier)
          .fetchWeather();
      expect(
        riverpodTestTools.container
            .read(dayWeatherApiCallStateProvider)
            .valueOrNull,
        resultSuccess,
      );

      // ローディング状態に変更
      when(useCaseMock.call()).thenAnswer((_) => fetchCompleter.future);
      final futureResult = riverpodTestTools.container
          .read(dayWeatherApiCallStateProvider.notifier)
          .fetchWeather();
      expect(
        riverpodTestTools.container
            .read(dayWeatherApiCallStateProvider)
            .isLoading,
        isTrue,
      );

      // Act
      final actual = riverpodTestTools.container.read(dayWeatherProvider);

      fetchCompleter.complete(resultSuccess);
      await futureResult;

      // 念の為、ローディングが完了しているかを確認
      expect(
        riverpodTestTools.container
            .read(dayWeatherApiCallStateProvider)
            .isLoading,
        isFalse,
      );

      // Assert
      expect(actual, weather);
    });
  });
}
