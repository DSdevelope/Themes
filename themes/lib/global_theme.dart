import 'package:flutter/material.dart';

ThemeData globalTheme() => ThemeData(
  fontFamily: 'Georgia',
  splashColor: Colors.lightBlueAccent,

  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.purple,
    brightness: Brightness.light,
  ).copyWith(
    secondary: Colors.indigo,
  ),

  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 80, fontWeight: FontWeight.w600),
    headline4: TextStyle(fontSize: 54, fontWeight: FontWeight.bold),
    headline5: TextStyle(fontSize: 40, fontStyle: FontStyle.italic, color: Colors.orange),
    bodyText2: TextStyle(fontSize: 15, fontFamily: 'Roboto', color: Colors.deepPurple),
    button: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
  ),
  dividerTheme: const DividerThemeData(color: Colors.indigo, thickness: 1.3),
);