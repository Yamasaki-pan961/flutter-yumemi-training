import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/feature/day_weather/presentation/view/components/temperature_text.dart';

import '../../../../../utils_for_test/robot.dart';

class TemperatureTextRobot extends Robot<TemperatureText> {
  TemperatureTextRobot(super.tester);
  TemperatureTextRobot.withKey(super.tester, super.key) : super.withKey();

  // Expectation
  void expectNotExist(TemperatureType type) => expect(this, findsNothing);
  void expectWithText(String text) => expect(
        find.descendant(of: this, matching: find.text(text)),
        findsOneWidget,
      );
  // 色があっているかどうかのexpectなども書いて良さそう
}
