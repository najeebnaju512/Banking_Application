import 'dart:convert';
import 'dart:developer';
import 'package:digibank/core/app_utils/app_utils.dart';
import 'package:digibank/repository/api/profile_screen/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app_config/app_config.dart';
import '../../../core/static_data/static_data.dart';
import '../../../repository/api/profile_screen/services/profile_service.dart';

class ProfileController extends ChangeNotifier {
  late ProfileModel profileModel = ProfileModel();
  late SharedPreferences sharedPreferences;
  final _fillMessage = StaticData.errorMsg;
  bool isLoading = false;
  late Map<String, dynamic> userData;

  fetchProfileData(context) async {
    isLoading = true;
    notifyListeners();
    log("ProfileController>>fetchProfileData");
    fetchUserDetails().then((rawData) {
      userData = json.decode(rawData);
      var uId = userData["id"];
      log("$uId");
      ProfileService.fetchProfile(uId).then((resData) {
        if (resData["status"] == 1) {
          profileModel = ProfileModel.fromJson(resData["data"]);
          isLoading=false;
        } else {
          AppUtils.oneTimeSnackBar("Error: Data Not Found ", context: context);
        }
        notifyListeners();
      });
    });

  }

  String? get firstName => profileModel.firstName;
  String? get lastName => profileModel.lastName??_fillMessage;
  String? get username => profileModel.username??_fillMessage;
  int? get accNo => profileModel.accountNumber;
  double? get balance => profileModel.accountBalance;
  String? get address => profileModel.address??_fillMessage;
  String? get ifsc => profileModel.ifsc;
  int? get mobileNo => profileModel.phone;
  String? get mailid => profileModel.email??_fillMessage;
  // Method to get masked account number
  String get maskedAccountNumber {
    final String accountNumber = profileModel.accountNumber.toString();
    if (accountNumber.length >= 8) {
      final String firstFourDigits = accountNumber.substring(0, 4);
      final String lastFourDigits = accountNumber.substring(accountNumber.length - 4);
      final String maskedDigits = 'X' * (accountNumber.length - 8); // Number of masked digits between first and last four digits
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
}
