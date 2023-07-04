import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/common/presentation/view/components/weather_icon.dart';

import '../../../../utils_for_test/robot.dart';
import 'svg_picture_robot.dart';

class WeatherIconRobot extends Robot<WeatherIcon> {
  WeatherIconRobot(super.tester, super.parent) : super.child();

  SvgPictureRobot get svgPicture => SvgPictureRobot(tester);

  // Expectation
  void expectNotExist() => expect(this, findsNothing);
  void expectExist() => expect(this, findsOneWidget);
}

class WeatherIconAssetNames {
  static const path = 'assets/images/weather_icons/';
  static const rainy =  '${path}rainy.svg';
  static const cloudy =  '${path}cloudy.svg';
  static const sunny =  '${path}sunny.svg';
}
