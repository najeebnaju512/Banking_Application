import 'dart:developer';

import '../../../helper/api_helper.dart';

class RegistrationService {
  static Future<dynamic> postRegistrationData(Map<String, dynamic> data) async {
    try {
      var decodedData = await ApiHelper.postData(
          endPoint: "password-reset-view/", body: data);
      var message = decodedData["message"];
      if (decodedData["status"] == 1) {
        log("RegistrationServices>postRegistrationData()>success = $message");
        return decodedData;
      } else {
        log(decodedData["status"].toString());
        log("RegistrationServices>postRegistrationData()>failed ");
        return decodedData;
      }
    } catch (e) {
      log("$e");
    }
  }
}
