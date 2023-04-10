import 'package:flutter/material.dart';

enum TemperatureType {
  high,
  low,
}

class TemperatureText extends StatelessWidget {
  const TemperatureText(
    this.data, {
    required this.type,
    super.key,
  });
  final String data;
  final TemperatureType type;
  @override
  Widget build(BuildContext context) {
    final color = type == TemperatureType.high ? Colors.red : Colors.blue;
    final labelLarge = Theme.of(context).textTheme.labelLarge;
    final textStyle = labelLarge?.copyWith(color: color);
    
    return Text(
      data,
      textAlign: TextAlign.center,
      style: textStyle,
    );
  }
}
