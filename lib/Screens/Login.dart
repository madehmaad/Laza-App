import 'package:flutter/material.dart';
import 'package:laza_app/Config/Theme.dart';
import 'package:laza_app/Config/di.dart';
import 'package:laza_app/Screens/Global/NavigationPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController username;
  late TextEditingController password;
  late bool valuser;
  late bool valpass;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    username = TextEditingController();
    password = TextEditingController();
    valuser = false;
    valpass = false;

    super.initState();
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 105),
              child: Text(
                'Welcome',
                style: TextStyle(
                  color: Color(0xFF1D1E20),
                  fontSize: 28,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'Please enter your data to continue',
                style: TextStyle(
                  color: Color(0xFF8F959E),
                  fontSize: 15,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Form(
              autovalidateMode: AutovalidateMode.always,
              key: formkey,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 225, right: 40, left: 40),
                    child: SizedBox(
                      width: 400,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty || value == '') {
                            valuser = false;
                            return "You must enter your Name";
                          } else {
                            valuser = true;
                            return null;
                          }
                        },
                        controller: username,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, right: 40, left: 40),
                    child: SizedBox(
                      width: 400,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty || value == '') {
                            valpass = false;
                            return "You must enter your PassWord";
                          } else {
                            valpass = true;
                            return null;
                          }
                        },
                        obscureText: true,
                        controller: password,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, right: 40, left: 40),
              child: InkWell(
                onTap: () {
                  if (valpass && valuser) {
                    config
                        .get<SharedPreferences>()
                        .setString('username', username.text);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NavigationPage(
                                  selectedIndex: 0,
                                )));
                    print("Login");
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                      duration: Duration(seconds: 2),
                      content: Text(
                        'Please fill all your data ',
                        style: TextStyle(fontSize: 17),
                      ),
                      backgroundColor: Color.fromARGB(255, 232, 103, 43),
                    ));
                  }
                },
                child: Container(
                  width: 287,
                  height: 59,
                  decoration: ShapeDecoration(
                    color: ThemeColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
