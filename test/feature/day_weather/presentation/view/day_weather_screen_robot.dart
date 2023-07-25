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
  Finder get _loadingDialog => find.byKey(DayWeatherScreen.loadingDialogKey);
  WeatherInfoRobot get weatherInfo => WeatherInfoRobot.child(tester, this);

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
  void expectErrorDialogNotShown() => expect(_dialog, findsNothing);
  void expectErrorDialogShownWithMessage(String message) => expect(
        find.descendant(of: _dialog, matching: find.text(message)),
        findsOneWidget,
      );
  void expectLoadingDialogShown() => expect(_loadingDialog, findsOneWidget);
  void expectLoadingDialogNotShown() => expect(_loadingDialog, findsNothing);
  void expectCloseButtonShown() => expect(_closeButton, findsOneWidget);
  void expectReloadButtonShown() => expect(_reloadButton, findsOneWidget);
}
