import 'dart:developer';

import 'package:digibank/app_config/app_config.dart';
import 'package:digibank/core/app_utils/app_utils.dart';
import 'package:digibank/presentation/login_screen/view/login_screen.dart';
import 'package:digibank/repository/api/registration_screen/services/registration_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationController extends ChangeNotifier {
  late SharedPreferences sharedPreferences;

  Future onRegistration(
      String enteredUsername, String accountNumber, var context) async {
    var data = {"username": enteredUsername, "account_number": accountNumber};
    RegistrationService.postRegistrationData(data).then((resData) {
      log("onRegistration ${resData["status"]}");
      if (resData["status"] == 1) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
        storeUserName(enteredUsername);
      } else {
        var message = resData["error"];
        AppUtils.oneTimeSnackBar(message, context: context);
      }
    });
  }

  void storeUserName(String enteredUsername) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(AppConfig.userName, enteredUsername);
    sharedPreferences.setBool(AppConfig.status, true);
  }
}
