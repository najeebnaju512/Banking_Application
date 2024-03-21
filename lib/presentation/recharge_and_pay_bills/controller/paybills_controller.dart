import 'dart:convert';
import 'dart:developer';

import 'package:digibank/core/app_utils/app_utils.dart';
import 'package:digibank/repository/api/pay_bills_screen/services/paybills_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app_config/app_config.dart';
import '../../bottom_navigation_screen/view/bottom_navigation.dart';

class PayBillsController extends ChangeNotifier {
  late SharedPreferences sharedPreferences;
  late Map<String, dynamic> userData;

  void onPayBill(
      String catagory, String amount, String mPin, BuildContext context) {
    fetchUserDetails().then((uData) {
      userData = json.decode(uData);
      var uId = userData["id"];
      var data = {
        "payment_for": catagory.toString(),
        "logged_user_id": uId.toString(),
        "payment_amount": amount.toString(),
        "mpin": mPin.toString()
      };
      PayBillsServices.postPayBill(data).then((resData) {
        if (resData["status"] == 1) {
          var data = resData["data"];
          if (data["message"] == "bill payment succesfully done") {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => const BottomNavigation()),
                (route) => false);
          } else if (data["message"] == "invalid mpin") {
            var message = data["message"];
            AppUtils.oneTimeSnackBar(message, context: context);
          } else {
            var message = data["status"];
            AppUtils.oneTimeSnackBar(message, context: context);
          }
        } else {
          log("PayBillsController>>onPayBill>>failed");
        }
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
