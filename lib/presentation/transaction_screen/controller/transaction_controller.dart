import 'dart:convert';
import 'dart:developer';

import 'package:digibank/repository/api/transaction_screen/model/transaction_screen_model.dart';
import 'package:digibank/repository/api/transaction_screen/services/transaction_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app_config/app_config.dart';
import '../../../core/app_utils/app_utils.dart';

class TransactionController extends ChangeNotifier {
  late TransactionModel transactionModel = TransactionModel();
  late SharedPreferences sharedPreferences;
  bool isLoading = false;
  late Map<String, dynamic> userData;
  List<dynamic>? transactionHistory;

  fetchTransactionData(context) async {
    isLoading = true;
    notifyListeners();
    log("TransactionController>>fetchTransactionData");
    fetchUserDetails().then((rawData) {
      userData = json.decode(rawData);
      var uId = userData["id"];
      log("$uId");
      TransactionService.fetchProfile(uId).then((resData) {
        if (resData["status"] == 1) {
          transactionHistory = List<TransactionModel>.from(
              resData["data"].map((x) => TransactionModel.fromJson(x)));
        } else {
          AppUtils.oneTimeSnackBar("Error: Data Not Found ", context: context);
        }
        isLoading = false;
        notifyListeners();
      });
    });
  }

  Future<String> fetchUserDetails() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var uData = sharedPreferences.getString(AppConfig.userData);
    log("TransactionController >>fetch userData >> ${uData!}");
    return uData;
  }
}
