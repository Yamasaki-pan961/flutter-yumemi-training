import 'package:flutter/material.dart';

enum TemperatureType {
  high,
  low,
}

extension TemperatureTypeColor on TemperatureType {
  Color get color {
    switch (this) {
      case TemperatureType.high:
        return Colors.red;
      case TemperatureType.low:
        return Colors.blue;
    }
  }
}

class TemperatureText extends StatelessWidget {
  const TemperatureText({
    required this.temperature,
    required this.type,
    super.key,
  });
  final int? temperature;
  final TemperatureType type;
  @override
  Widget build(BuildContext context) {
    final color = type.color;
    final labelLarge = Theme.of(context).textTheme.labelLarge;
    final textStyle = labelLarge?.copyWith(color: color);
    final text = '${temperature?.toString() ?? '**'} ℃';
    return Text(
      text,
      textAlign: TextAlign.center,
      style: textStyle,
    );
  }
}
