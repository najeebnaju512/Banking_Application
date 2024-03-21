import 'dart:developer';

import 'package:digibank/repository/helper/api_helper.dart';

class SendMoneyService {
  static Future<dynamic> postTransactionDataSameBank(Map<String, dynamic> data) async {
    try {
      var decodedData = await ApiHelper.postData(endPoint: "fund-transfer/", body: data);
      var message = decodedData["message"];
      if (message == "fund tranfered succesfully") {
        log("transfer success");
        return decodedData;
      } else {
        log("transfer failed");
        return decodedData;
      }
    } catch (e) {
      log("$e");
    }
  }

  static Future<dynamic> postTransactionDataDiffBank(Map<String, dynamic> data) async {
    try {
      var decodedData = await ApiHelper.postData(endPoint: "other-transactions/", body: data);
      var message = decodedData["message"];
      if (message == "fund tranfered succesfully") {
        log("transfer success");
        return decodedData;
      } else {
        log("transfer failed");
        return decodedData;
      }
    } catch (e) {
      log("$e");
    }
  }
}
