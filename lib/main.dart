import 'package:flutter/material.dart';
import 'package:mazerunner/Pages/game%20mode/Homepage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mazerunner/Pages/splash_screen.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avi Maze Runner',
      debugShowCheckedModeBanner: false,
      // home: MazeRunner(),
      home: SplashScreenPage(),
    );
  }
}


