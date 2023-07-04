import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/common/domain/entities/weather.dart';
import 'package:flutter_training/common/utils/result.dart';
import 'package:flutter_training/feature/day_weather/domain/use_case/fetch_day_weather_use_case.dart';
import 'package:flutter_training/feature/day_weather/presentation/presenter/day_weather_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../common/presentation/view/components/weather_icon_robot.dart';
import '../../../../utils_for_test/display_size.dart';
import 'day_weather_screen_robot.dart';
import 'day_weather_screen_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<FetchDayWeatherUseCase>(),
])
void main() async {
  setDisplaySize();
  testWidgets('Test the screen before data acquisition', (widgetTester) async {
    final robot = DayWeatherScreenRobot(widgetTester);
    await robot.showScreen();

    robot
      ..expectCloseButtonShown()
      ..expectReloadButtonShown()
      ..expectDialogNotShown();

    robot.weatherInfo.expectShown();
    robot.weatherInfo.maxTemperatureText.expectWithText('** ℃');
    robot.weatherInfo.minTemperatureText.expectWithText('** ℃');
    robot.weatherInfo.weatherIcon.expectNotExist();
  });

  group('When the reload button is pressed, ', () {
    group(
      'when a fetching succeeds, ',
      () {
        final baseWeather = Weather(
          weatherCondition: WeatherCondition.sunny,
          maxTemperature: 10,
          minTemperature: 0,
          date: DateTime(2023),
        );
        testWidgets('sunny icon is displayed', (widgetTester) async {
          // Arrange
          final useCaseMock = MockFetchDayWeatherUseCase();
          final result = Result<Weather, String>.success(
            baseWeather.copyWith(weatherCondition: WeatherCondition.sunny),
          );
          when(useCaseMock()).thenReturn(result);
          final robot = DayWeatherScreenRobot(widgetTester);
          await robot.showScreen(
            providerOverrides: [
              fetchDayWeatherUseCaseProvider.overrideWithValue(useCaseMock)
            ],
          );

          await robot.tapReloadButton();

          robot.weatherInfo.weatherIcon
            ..expectExist()
            ..svgPicture
                .expectAssetToBeShown(assetName: WeatherIconAssetNames.sunny);
        });
        testWidgets('cloudy icon is displayed', (widgetTester) async {
          // Arrange
          final useCaseMock = MockFetchDayWeatherUseCase();
          final result = Result<Weather, String>.success(
            baseWeather.copyWith(weatherCondition: WeatherCondition.cloudy),
          );
          when(useCaseMock()).thenReturn(result);
          final robot = DayWeatherScreenRobot(widgetTester);
          await robot.showScreen(
            providerOverrides: [
              fetchDayWeatherUseCaseProvider.overrideWithValue(useCaseMock)
            ],
          );

          await robot.tapReloadButton();

          robot.weatherInfo.weatherIcon
            ..expectExist()
            ..svgPicture
                .expectAssetToBeShown(assetName: WeatherIconAssetNames.cloudy);
        });

        testWidgets('cloudy icon is displayed', (widgetTester) async {
          // Arrange
          final useCaseMock = MockFetchDayWeatherUseCase();
          final result = Result<Weather, String>.success(
            baseWeather.copyWith(weatherCondition: WeatherCondition.cloudy),
          );
          when(useCaseMock()).thenReturn(result);
          final robot = DayWeatherScreenRobot(widgetTester);
          await robot.showScreen(
            providerOverrides: [
              fetchDayWeatherUseCaseProvider.overrideWithValue(useCaseMock)
            ],
          );

          await robot.tapReloadButton();

          robot.weatherInfo.weatherIcon
            ..expectExist()
            ..svgPicture
                .expectAssetToBeShown(assetName: WeatherIconAssetNames.cloudy);
        });

        testWidgets('rainy icon is displayed', (widgetTester) async {
          // Arrange
          final useCaseMock = MockFetchDayWeatherUseCase();
          final result = Result<Weather, String>.success(
            baseWeather.copyWith(weatherCondition: WeatherCondition.rainy),
          );
          when(useCaseMock()).thenReturn(result);
          final robot = DayWeatherScreenRobot(widgetTester);
          await robot.showScreen(
            providerOverrides: [
              fetchDayWeatherUseCaseProvider.overrideWithValue(useCaseMock)
            ],
          );

          await robot.tapReloadButton();

          robot.weatherInfo.weatherIcon
            ..expectExist()
            ..svgPicture
                .expectAssetToBeShown(assetName: WeatherIconAssetNames.rainy);
        });

        testWidgets('temperature is displayed', (widgetTester) async {
          // Arrange
          final useCaseMock = MockFetchDayWeatherUseCase();
          final result = Result<Weather, String>.success(
            baseWeather.copyWith(maxTemperature: 31, minTemperature: -19),
          );
          when(useCaseMock()).thenReturn(result);
          final robot = DayWeatherScreenRobot(widgetTester);
          await robot.showScreen(
            providerOverrides: [
              fetchDayWeatherUseCaseProvider.overrideWithValue(useCaseMock)
            ],
          );

          await robot.tapReloadButton();

          robot.weatherInfo
            ..maxTemperatureText.expectWithText('31 ℃')
            ..minTemperatureText.expectWithText('-19 ℃');
        });
      },
    );

    testWidgets('when a fetching fails', (widgetTester) async {
      // Arrange
      final useCaseMock = MockFetchDayWeatherUseCase();
      const result = Result<Weather, String>.failure('特定のエラーメッセージ');
      when(useCaseMock()).thenReturn(result);
      final robot = DayWeatherScreenRobot(widgetTester);
      await robot.showScreen(
        providerOverrides: [
          fetchDayWeatherUseCaseProvider.overrideWithValue(useCaseMock)
        ],
      );

      await robot.tapReloadButton();

      robot.expectDialogShownWithMessage('特定のエラーメッセージ');
    });
  });
}