import 'dart:developer';

import '../../../helper/api_helper.dart';

class HomeScreenService {
  static Future<dynamic> fetchProfile(id) async {
    try {
      var decodedData = await ApiHelper.getData(
        endPoint: "user-profile-view/$id/",
      );
      log("HomeScreenService>>fetchProfile");
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }
}
