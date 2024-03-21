import 'dart:convert';
import 'dart:developer';

import 'package:digibank/core/constants/global_text_style.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app_config/app_config.dart';

class AppUtils {
  late SharedPreferences sharedPreferences;
  //to get access key
  static Future<String?> getAccessKey() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    log("getAccessKey() sharedprefrence object created");

    if (sharedPreferences.get(AppConfig.loginData) != null) {
      log("getAccessKey()->checked if AppConfig.LOGIN_DATA is null");
      final access = jsonDecode(
          sharedPreferences.get(AppConfig.loginData) as String)['access'];
      log("stored 'access' from AppConfig.LOGIN_DATA to access in getAccessKey() ");
      return access;
    } else {
      log("getAccessKey() returned null");
      return null;
    }
  }

  static Future<dynamic> getUserDetails() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    log("AppUtils>>getUserId() sharedprefrence object created");
    if (sharedPreferences.get(AppConfig.loginData) != null) {
      log("AppUtils>>getUserId->checked if AppConfig.LOGIN_DATA is not null");
      // Retrieve the stored string and parse it back to a dynamic object
      String? jsonString = sharedPreferences.getString(AppConfig.loginData);
      dynamic userDetails;
      if (jsonString != null) {
        userDetails = json.decode(jsonString);
      }
      log("stored 'userId' from AppConfig.LOGIN_DATA to access in getUserId() ");
      // log("$userDetails");
      return userDetails;
    } else {
      log("getUserId() returned null");
      return null;
    }
  }

  static oneTimeSnackBar(
    String? message, {
    int time = 2,
    Color? bgColor,
    TextStyle? textStyle,
    required BuildContext context,
    bool showOnTop = false,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ///To CLEAR PREVIOUS SNACK BARS
    return ScaffoldMessenger.of(context)
        // ScaffoldMessenger.of(context??Routes.router.routerDelegate.navigatorKey.currentState!.context)
        .showSnackBar(
      SnackBar(
        /*action:SnackBarAction(label: "Ok",
        onPressed: (){
          SystemSettings.internalStorage();
        },
        ) ,*/

        behavior: showOnTop ? SnackBarBehavior.floating : null,
        backgroundColor: bgColor ?? Colors.white60,
        content: Text(message!, style: textStyle ?? GLTextStyles.labeltxtred16),
        duration: Duration(seconds: time),
        margin: showOnTop
            ? EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height - 100,
                right: 20,
                left: 20)
            : null,
      ),
    );
  }
}
