import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void setDisplaySize({Size size = const Size(390, 844)}) {
  final binding = TestWidgetsFlutterBinding.ensureInitialized();
  binding.window.physicalSizeTestValue = size;
  binding.window.devicePixelRatioTestValue = 1;
}
