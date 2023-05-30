import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_training/common/domain/entities/weather.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({required this.weatherCondition, super.key});
  final WeatherCondition weatherCondition;

  @override
  Widget build(BuildContext context) {
    const iconDirectoryPath = 'assets/images/weather_icons/';
    final iconPath = '$iconDirectoryPath${weatherCondition.name}.svg';
    return SvgPicture.asset(iconPath);
  }
}
