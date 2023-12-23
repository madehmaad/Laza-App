import 'package:flutter/material.dart';
import 'package:laza_app/Config/di.dart';
import 'package:laza_app/Screens/Global/LoadingData.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextEditingController search = TextEditingController();


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 30),
            child: Text(
              'Hello ' +
                  (config.get<SharedPreferences>().getString('username')!),
              style: TextStyle(
                color: Color(0xFF1D1E20),
                fontSize: 28,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                letterSpacing: -0.21,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 30),
            child: Text(
              'Welcome to Laza.',
              style: TextStyle(
                color: Color(0xFF8F959E),
                fontSize: 15,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0.07,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
                child: (products.isEmpty || products == [])
                    ? DataBuilder()
                    : searchScaffold(
                        result: products, search_result: SearchList)),
          ),
        ],
      ),
    );
  }
}
