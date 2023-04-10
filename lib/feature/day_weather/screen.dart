import 'package:flutter/material.dart';

class DayWeatherScreen extends StatefulWidget {
  const DayWeatherScreen({super.key});

  @override
  State<DayWeatherScreen> createState() => _DayWeatherScreenState();
}

class _DayWeatherScreenState extends State<DayWeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Day Weather Screen')));
  }
}
