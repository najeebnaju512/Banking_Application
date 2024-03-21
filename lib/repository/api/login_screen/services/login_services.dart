import 'dart:developer';

import '../../../helper/api_helper.dart';

class LoginService {
    static Future<dynamic> postLoginData(Map<String, dynamic> data) async {
    try {
      var decodedData = await ApiHelper.postData(
          endPoint: "user-login-get-token/", body: data);
      var message = decodedData["message"];
      if (decodedData["status"] == 1) {
        log("RegistrationServices>postLoginData()>success = $message");
        return decodedData;
      } else {
        log(decodedData["status"].toString());
        log("RegistrationServices>postLoginData()>failed ");
        return decodedData;
      }
    } catch (e) {
      log("$e");
    }
  }
  
}