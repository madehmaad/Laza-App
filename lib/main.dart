import 'package:flutter/material.dart';
import 'package:laza_app/Config/Theme.dart';
import 'package:laza_app/Config/di.dart';
import 'package:laza_app/Screens/Starter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getThemeData(),
      home: StarterPage(),
    );
  }
}
