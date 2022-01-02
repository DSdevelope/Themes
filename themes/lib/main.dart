import 'package:flutter/material.dart';
import 'package:themes/global_theme.dart';
import 'main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza calculator',
      theme: globalTheme(),
      home: const MainScreen(),
    );
  }
}
