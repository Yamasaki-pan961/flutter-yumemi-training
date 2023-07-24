import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/feature/day_weather/presentation/view/day_weather_screen.dart';

import '../../../../utils_for_test/robot.dart';
import 'components/weather_info_robot.dart';

class DayWeatherScreenRobot extends Robot<DayWeatherScreen> {
  DayWeatherScreenRobot(super.tester);

  // Finders
  Finder get _closeButton => find.byKey(DayWeatherScreen.closeButtonKey);
  Finder get _reloadButton => find.byKey(DayWeatherScreen.reloadButtonKey);
  Finder get _dialog => find.byType(Dialog);
  WeatherInfoRobot get weatherInfo => WeatherInfoRobot.child(tester, this);
  Finder get _loadingSpinner => find.byKey(DayWeatherScreen.loadingSpinnerKey);

  // Actions
  Future<void> showScreen({
    List<Override> providerOverrides = const [],
  }) async {
    await tester.pumpWidget(
      wrapRootWidget(
        const DayWeatherScreen(),
        providerOverrides: providerOverrides,
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> tapCloseButton() async {
    await tester.tap(_closeButton);
    await tester.pumpAndSettle();
  }

  Future<void> tapReloadButton() async {
    await tester.tap(_reloadButton);
    await tester.pump();
  }

  // Expectation
  void expectDialogNotShown() => expect(_dialog, findsNothing);
  void expectDialogShownWithMessage(String message) => expect(
        find.descendant(of: _dialog, matching: find.text(message)),
        findsOneWidget,
      );
  void expectLoadingSpinnerShown() => expect(_loadingSpinner, findsOneWidget);
  void expectLoadingSpinnerNotShown() => expect(_loadingSpinner, findsNothing);
  void expectCloseButtonShown() => expect(_closeButton, findsOneWidget);
  void expectReloadButtonShown() => expect(_reloadButton, findsOneWidget);
}
