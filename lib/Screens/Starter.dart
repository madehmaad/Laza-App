import 'package:flutter/material.dart';
import 'package:laza_app/Config/Theme.dart';
import 'package:laza_app/Config/di.dart';
import 'package:laza_app/Screens/Login.dart';
import 'package:laza_app/Screens/Global/NavigationPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StarterPage extends StatefulWidget {
  const StarterPage({super.key});

  @override
  State<StarterPage> createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage> {
  @override
  void initState() {
    _navigator();
    super.initState();
  }

  _navigator() async {
    await Future.delayed(Duration(seconds: 2), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                (config.get<SharedPreferences>().getString('username') == '')
                    ? Login()
                    : NavigationPage(selectedIndex: 0,)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor,
      body: Center(
        child: Container(
          width: 59,
          height: 36,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Logo.png"),
            ),
          ),
        ),
      ),
    );
  }
}
