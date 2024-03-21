import 'dart:developer';

import '../../../helper/api_helper.dart';

class TransactionService {
  static Future<dynamic> fetchProfile(id) async{
    try {
      var decodedData = await ApiHelper.getData(
        endPoint: "user-fund-transfer-details/$id/",
      );
      return decodedData;
    } catch (e) {
      log("$e");
    }

  }
  
}