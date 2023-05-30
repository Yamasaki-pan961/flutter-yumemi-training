import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/common/domain/entities/weather.dart';

void main() {
  group(
    'Weather Entity',
    () {
      test(
        '',
        () async {
          final jsonMap = {
            'weather_condition': 'rainy',
            'max_temperature': ''
          };
        },
      );
    },
  );
}
