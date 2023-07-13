import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils_for_test/robot.dart';

class SvgPictureRobot extends Robot<SvgPicture> {
  SvgPictureRobot(super.tester) : super();

  // Finders
  Finder findWithAssetName(String assetName) => find.byWidgetPredicate(
        (widget) =>
            widget is SvgPicture &&
            (widget.bytesLoader as SvgAssetLoader).assetName == assetName,
      );

  // Expectations
  void expectAssetToBeShown({required String assetName}) =>
      expect(findWithAssetName(assetName), findsOneWidget);
}
