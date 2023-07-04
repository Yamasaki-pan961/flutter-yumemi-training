import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/feature/day_weather/presentation/view/components/weather_info.dart';

import '../../../../../common/presentation/view/components/weather_icon_robot.dart';
import '../../../../../utils_for_test/robot.dart';
import 'temperature_text_robot.dart';

class WeatherInfoRobot extends Robot<WeatherInfo> {
  WeatherInfoRobot.child(super.tester, super.parent) : super.child();

  // Finders
  WeatherIconRobot get weatherIcon => WeatherIconRobot(tester, this);
  TemperatureTextRobot get maxTemperatureText =>
      TemperatureTextRobot.withKey(tester, WeatherInfo.maxTemperatureKey);

  TemperatureTextRobot get minTemperatureText =>
      TemperatureTextRobot.withKey(tester, WeatherInfo.minTemperatureKey);

  // Expectation
  void expectShown() => expect(this, findsOneWidget);
}
