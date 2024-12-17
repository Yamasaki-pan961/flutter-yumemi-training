import 'package:flutter/material.dart';
import 'package:flutter_training/feature/launch/presentation/view/launch_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LaunchScreen(),
      checkerboardRasterCacheImages: true,
      checkerboardOffscreenLayers: true,
    );
  }
}
