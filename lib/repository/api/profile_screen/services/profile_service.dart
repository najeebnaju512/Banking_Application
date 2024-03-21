import 'dart:developer';

import '../../../helper/api_helper.dart';

class ProfileService {
  static Future<dynamic> fetchProfile(id) async {
    try {
      var decodedData = await ApiHelper.getData(
        endPoint: "user-profile-view/$id/",
      );
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }
}
