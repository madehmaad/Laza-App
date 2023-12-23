import 'package:flutter/material.dart';
import 'package:laza_app/Config/Theme.dart';
import 'package:laza_app/Screens/Global/methods.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            ValidateLogout(context);
          },
          child: Container(
            width: 300,
            height: 100,
            decoration: ShapeDecoration(
              color: ThemeColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Center(
                child: Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            )),
          ),
        ),
      ),
    );
  }
}
