import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';

Finder findSvgImage(String assetName) => find.byWidgetPredicate(
      (widget) =>
          widget is SvgPicture &&
          (widget.bytesLoader as SvgAssetLoader).assetName == assetName,
    );
