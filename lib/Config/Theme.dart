import 'package:flutter/material.dart';

ThemeData getThemeData() {
  return ThemeData(
    useMaterial3: true,
    // app bar theme config
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFF5F6FA),
      centerTitle: true,
    ),
    colorSchemeSeed: Color.fromRGBO(151, 117, 250, 1),

    scaffoldBackgroundColor: Colors.white,
  );
}

Color ThemeColor = Color.fromRGBO(151, 117, 250, 1);
