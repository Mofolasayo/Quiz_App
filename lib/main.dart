import 'package:flutter/material.dart';
import 'package:quiz_app/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 172, 190, 248)),
          useMaterial3: true,
          textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white))),
      home: const SplashScreen(),
    );
  }
}
