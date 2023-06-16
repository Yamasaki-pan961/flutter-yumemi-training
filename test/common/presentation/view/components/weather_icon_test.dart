import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/common/domain/entities/weather.dart';
import 'package:flutter_training/common/presentation/view/components/weather_icon.dart';

import '../../../../utils_for_test/display_size.dart';
import '../../../../utils_for_test/find_svg_image.dart';

class _TestWeatherIcon extends StatelessWidget {
  const _TestWeatherIcon(this.weatherCondition);

  final WeatherCondition weatherCondition;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherIcon(weatherCondition: weatherCondition),
    );
  }
}

void main() {
  setDisplaySize();
  const basePath = 'assets/images/weather_icons/';
  testWidgets(
    'When weatherCondition is sunny, display sunny.svg',
    (widgetTester) async {
      // Arrange
      const weatherCondition = WeatherCondition.sunny;
      await widgetTester.pumpWidget(const _TestWeatherIcon(weatherCondition));

      // Act
      const assetName = '${basePath}sunny.svg';
      final act = findSvgImage(assetName);

      // Assert
      expect(act, findsOneWidget);
    },
  );

  testWidgets('When weatherCondition is rainy, display rainy.svg',
      (widgetTester) async {
    // Arrange
    const weatherCondition = WeatherCondition.rainy;
    await widgetTester.pumpWidget(const _TestWeatherIcon(weatherCondition));

    // Act
    const assetName = '${basePath}rainy.svg';
    final act = findSvgImage(assetName);

    // Assert
    expect(act, findsOneWidget);
  });

  testWidgets(
    'When WeatherCondition is cloudy, display cloudy.svg',
    (widgetTester) async {
      // Arrange
      const weatherCondition = WeatherCondition.cloudy;
      await widgetTester.pumpWidget(const _TestWeatherIcon(weatherCondition));

      // Act
      const assetName = '${basePath}cloudy.svg';
      final act = findSvgImage(assetName);

      // Assert
      expect(act, findsOneWidget);
    },
  );
}
