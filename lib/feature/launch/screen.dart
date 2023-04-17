import 'package:flutter/material.dart';
import 'package:flutter_training/feature/day_weather/screen.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => LaunchScreenState();
}

class LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.endOfFrame.then((_) => _delayedNavigation());
  }

  Future<void> _delayedNavigation() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));

    if (!mounted) {
      return;
    }
    final pageRoute = MaterialPageRoute<String>(
      builder: (context) => const DayWeatherScreen(),
    );

    await Navigator.of(context).push(pageRoute);
    await _delayedNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}
