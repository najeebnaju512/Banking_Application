import 'dart:developer';

import '../../../helper/api_helper.dart';

class PayBillsServices {
  static Future<dynamic> postPayBill(Map<String, dynamic> data) async{
    try {
      var decodedData = await ApiHelper.postBillData(
          endPoint: "user-paybills/", body: data);
      var message = decodedData["message"];
      if (decodedData["message"] == "bill payment succesfully done" ) {
        log(" >>>>>>>> $message");
        return decodedData;
      } else {
        // log(decodedData["status"].toString());
        log("postPayBill>>>>>>failed ");
        return decodedData;
      }
    } catch (e) {
      log("$e");
    }
  }

  
}