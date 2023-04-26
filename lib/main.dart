import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/app.dart';
import 'package:simple_logger/simple_logger.dart';

void main() {
  const logLevel = kReleaseMode ? Level.OFF : Level.FINE;
  SimpleLogger().setLevel(
    logLevel,
    includeCallerInfo: !kReleaseMode,
  );
  runApp(const MyApp());
}
