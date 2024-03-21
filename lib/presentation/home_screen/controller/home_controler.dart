import 'dart:convert';
import 'dart:developer';

import 'package:digibank/core/static_data/static_data.dart';
import 'package:digibank/presentation/registration_screen/view/registration.dart';
import 'package:digibank/repository/api/home_screen/model/home_screen_model.dart';
import 'package:digibank/repository/api/home_screen/services/home_screen_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app_config/app_config.dart';
import '../../../core/app_utils/app_utils.dart';

class HomeScreenController extends ChangeNotifier {
  var imageList = [
    "asset/images/carousal1.jpg",
    "asset/images/carousal2.jpg",
    "asset/images/carousal3.jpg",
    "asset/images/carousal4.jpg",
  ];
  late HomeModel homeModel = HomeModel();
  final _fillMessage = StaticData.errorMsg;
  late Map<String, dynamic> userData;
  late SharedPreferences sharedPreferences;
  bool isLoading = false;

  fetchProfileDataHomeScreen(context) async {
    isLoading = true;
    notifyListeners();
    log("HomeScreenController>>fetchProfileDataHomeScreen");
    fetchUserDetails().then((rawData) {
      userData = json.decode(rawData);
      var uId = userData["id"];
      log("$uId");
      HomeScreenService.fetchProfile(uId).then((resData) {
        if (resData["status"] == 1) {
          homeModel = HomeModel.fromJson(resData["data"]);
          isLoading = false;
        } else {
          AppUtils.oneTimeSnackBar("Error: Data Not Found ", context: context);
        }
        notifyListeners();
      });
    });
  }

  void logOutFunction(BuildContext context) async {
    deleteUserData().then((value) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const RegistrationScreen()),
          (route) => false);
      setStatus();
    });
  }

  String? get firstName => homeModel.firstName;
  String? get lastName => homeModel.lastName ?? _fillMessage;
  String? get username => homeModel.username ?? _fillMessage;
  int? get accNo => homeModel.accountNumber;
  double? get balance => homeModel.accountBalance;
  String? get address => homeModel.address ?? _fillMessage;
  String? get ifsc => homeModel.ifsc;
  int? get mobileNo => homeModel.phone;
  String? get mailid => homeModel.email ?? _fillMessage;
  // Method to get masked account number
  String get maskedAccountNumber {
    final String accountNumber = homeModel.accountNumber.toString();
    if (accountNumber.length >= 8) {
      final String firstFourDigits = accountNumber.substring(0, 4);
      final String lastFourDigits =
          accountNumber.substring(accountNumber.length - 4);
      final String maskedDigits = 'X' *
          (accountNumber.length -
              8); // Number of masked digits between first and last four digits
      return '$firstFourDigits$maskedDigits$lastFourDigits';
    } else {
      return accountNumber;
    }
  }

  Future<String> fetchUserDetails() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var uData = sharedPreferences.getString(AppConfig.userData);
    log("ProfileController>>fetch username >> ${uData!}");
    return uData;
  }

  deleteUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(AppConfig.loginData);
    await sharedPreferences.remove(AppConfig.userData);
    await sharedPreferences.remove(AppConfig.userName);
  }

  void setStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(AppConfig.status, false);
  }
}
