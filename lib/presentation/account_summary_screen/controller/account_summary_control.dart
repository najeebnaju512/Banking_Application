import 'dart:convert';
import 'dart:developer';

import 'package:digibank/repository/api/account_summary_screen/model/account_summery_model.dart';
import 'package:digibank/repository/api/account_summary_screen/service/account_summary_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app_config/app_config.dart';
import '../../../core/app_utils/app_utils.dart';
import '../../../core/static_data/static_data.dart';

class ACCSumaryCantrol extends ChangeNotifier {
  late AccSummeryModel accSummeryModel = AccSummeryModel();
  late SharedPreferences sharedPreferences;
  final _fillMessage = StaticData.errorMsg;
  bool isLoading = false;
  late Map<String, dynamic> userData;

  fetchProfileData(context) async {
    isLoading = true;
    notifyListeners();
    log("ACCSumaryCantrol>>fetchProfileData");
    fetchUserDetails().then((rawData) {
      userData = json.decode(rawData);
      var uId = userData["id"];
      log("$uId");
      ACCSummaryService.fetchProfile(uId).then((resData) {
        if (resData["status"] == 1) {
          accSummeryModel = AccSummeryModel.fromJson(resData["data"]);
          isLoading=false;
        } else {
          AppUtils.oneTimeSnackBar("Error: Data Not Found ", context: context);
        }
        notifyListeners();
      });
    });

  }

  String? get firstName => accSummeryModel.firstName;
  String? get lastName => accSummeryModel.lastName??_fillMessage;
  String? get username => accSummeryModel.username??_fillMessage;
  int? get accNo => accSummeryModel.accountNumber;
  double? get balance => accSummeryModel.accountBalance;
  String? get address => accSummeryModel.address??_fillMessage;
  String? get ifsc => accSummeryModel.ifsc;
  int? get mobileNo => accSummeryModel.phone;
  String? get mailid => accSummeryModel.email??_fillMessage;
  // Method to get masked account number
  String get maskedAccountNumber {
    final String accountNumber = accSummeryModel.accountNumber.toString();
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
    log("ACCSummaryControl>>fetch username >> ${uData!}");
    return uData;
  }
}
