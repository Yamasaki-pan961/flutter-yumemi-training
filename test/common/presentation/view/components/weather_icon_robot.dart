import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/common/presentation/view/components/weather_icon.dart';

import '../../../../utils_for_test/robot.dart';
import 'svg_picture_robot.dart';

class WeatherIconRobot extends Robot<WeatherIcon> {
  WeatherIconRobot(super.tester, super.parent) : super.child();

  SvgPictureRobot get _svgPicture => SvgPictureRobot(tester);

// Expectation
  void expectNotExist() => expect(this, findsNothing);

  void _expectExist() => expect(this, findsOneWidget);

  void expectSunnyIconToBeShown() {
    _expectExist();
    _svgPicture.expectAssetToBeShown(
      assetName: WeatherIconAssetNames._sunny,
    );
  }

  void expectRainyIconToBeShown() {
    _expectExist();
    _svgPicture.expectAssetToBeShown(
      assetName: WeatherIconAssetNames._rainy,
    );
  }

  void expectCloudyIconToBeShown() {
    _expectExist();
    _svgPicture.expectAssetToBeShown(
      assetName: WeatherIconAssetNames._cloudy,
    );
  }
}

class WeatherIconAssetNames {
  static const _path = 'assets/images/weather_icons/';
  static const _rainy = '${_path}rainy.svg';
  static const _cloudy = '${_path}cloudy.svg';
  static const _sunny = '${_path}sunny.svg';
}
