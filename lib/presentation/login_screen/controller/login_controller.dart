import 'dart:convert';
import 'dart:developer';

import 'package:digibank/app_config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/app_utils/app_utils.dart';
import '../../../repository/api/login_screen/services/login_services.dart';
import '../../bottom_navigation_screen/view/bottom_navigation.dart';

class LoginController extends ChangeNotifier {
  late SharedPreferences sharedPreferences;
  Future onLogin(String mpin, BuildContext context) async {
    log("started onlogin from logincontroller");
    fetchUsername().then((userName) {
      log("Shared preferance data>> $userName");
      var data = {"username": userName, "mpin": mpin};
      LoginService.postLoginData(data).then((resData) {
        log("LoginController>>onLogin ${resData["status"]}");

        if (resData["status"] == "$userName logged in successfully") {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const BottomNavigation()));
          storeRecivedData(resData);
          storeUserData(resData);
          log("LoginController>>onLogin>>success");
        } else {
          var message = resData["error"];
          AppUtils.oneTimeSnackBar(message, context: context);
          log("LoginController>>onLogin>>failed");
        }
      });
    });
  }

  Future<String> fetchUsername() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var uname = sharedPreferences.getString(AppConfig.userName);
    log("fetchusername >> ${uname!}");
    return uname;
  }

  storeRecivedData(resData) async {
    log("storeRecivedData>>resData");
    sharedPreferences = await SharedPreferences.getInstance();
    String storeData = json.encode(resData);
    sharedPreferences.setString(AppConfig.loginData, storeData);
  }

  storeUserData(resData) async {
    log("storeUserData from>>UserData");
    sharedPreferences = await SharedPreferences.getInstance();
    String dataUser = json.encode(resData["user"]);
    sharedPreferences.setString(AppConfig.userData, dataUser);
  }
}
