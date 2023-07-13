import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/common/domain/entities/weather.dart';

import '../../../../utils_for_test/display_size.dart';
import 'weather_icon_robot.dart';

void main() {
  setUp(setDisplaySize);
  tearDown(clearDisplaySize);

  setDisplaySize();
  testWidgets(
    'When weatherCondition is sunny, display sunny.svg',
    (widgetTester) async {
      // Arrange
      final robot = WeatherIconRobot(widgetTester);

      // Action
      await robot.showScreen(WeatherCondition.sunny);

      // Assert
      robot.expectSunnyIconToBeShown();
    },
  );

  testWidgets('When weatherCondition is rainy, display rainy.svg',
      (widgetTester) async {
    final robot = WeatherIconRobot(widgetTester);

    // Action
    await robot.showScreen(WeatherCondition.rainy);

    // Assert
    robot.expectRainyIconToBeShown();
  });

  testWidgets(
    'When WeatherCondition is cloudy, display cloudy.svg',
    (widgetTester) async {
      final robot = WeatherIconRobot(widgetTester);

      // Action
      await robot.showScreen(WeatherCondition.cloudy);

      // Assert
      robot.expectCloudyIconToBeShown();
    },
  );
}
