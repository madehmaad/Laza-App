import 'package:flutter/material.dart';
import 'package:laza_app/Config/Theme.dart';
import 'package:laza_app/Config/di.dart';
import 'package:laza_app/Screens/Login.dart';
import 'package:laza_app/Screens/Global/NavigationPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

ValidateLogout(
  BuildContext context,
) {
  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => Container(
            width: 400,
            height: 400,
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.50, 0.00),
                end: Alignment(0.5, 1),
                colors: [ThemeColor, Colors.white],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 40, right: 10),
                  child: Text(
                    'Do you want to logout of your account?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 247, 247, 247)
                          .withOpacity(0.800000011920929),
                      fontSize: 18,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 70, left: 80),
                      child: InkWell(
                        onTap: () {
                          config
                              .get<SharedPreferences>()
                              .setString('username', '');
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Container(
                          width: 80,
                          height: 50,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'YES',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromARGB(255, 232, 11, 11)
                                    .withOpacity(0.800000011920929),
                                fontSize: 15,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 70, left: 80, right: 80),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 80,
                          height: 50,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'No',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromARGB(255, 5, 189, 15)
                                    .withOpacity(0.800000011920929),
                                fontSize: 15,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ));
}

ValidateAddProduct(
  BuildContext context,
) {
  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => Container(
            width: 400,
            height: 300,
            decoration: ShapeDecoration(
              color: ThemeColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.error_outline,
                  size: 70,
                  color: Colors.white,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: Text(
                    'Please fill all your product details',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 247, 247, 247)
                          .withOpacity(0.800000011920929),
                      fontSize: 22,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 70,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 80,
                        height: 50,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'OK',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0)
                                  .withOpacity(0.800000011920929),
                              fontSize: 15,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ));
}

AddedProduct(
  BuildContext context,
) {
  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => Container(
            width: 400,
            height: 300,
            decoration: ShapeDecoration(
              color: Colors.green.shade200,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.check,
                  size: 70,
                  color: Colors.white,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: Text(
                    'Your Product has been added',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 247, 247, 247)
                          .withOpacity(0.800000011920929),
                      fontSize: 22,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 70,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NavigationPage(
                                      selectedIndex: 2,
                                    )));
                      },
                      child: Container(
                        width: 80,
                        height: 50,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'OK',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0)
                                  .withOpacity(0.800000011920929),
                              fontSize: 15,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ));
}
