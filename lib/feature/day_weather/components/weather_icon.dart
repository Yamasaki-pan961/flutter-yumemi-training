import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_training/feature/day_weather/repository.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({required this.weatherType, super.key});
  final WeatherType weatherType;

  @override
  Widget build(BuildContext context) {
    const iconDirectoryPath = 'assets/images/weather_icons/';
    final iconPath = '$iconDirectoryPath${weatherType.name}.svg';
    return SvgPicture.asset(iconPath);
  }
}
