import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../app_config/app_config.dart';

class ApiHelper {
  //for get
  static getData({
    required String endPoint,
    Map<String, String>? header,
  }) async {
    log("ApiHelper>getData");
    final url = Uri.parse(AppConfig.baseurl + endPoint);
    try {
      var response = await http.get(url);
      log("Api Called => status code=${response.statusCode}");
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        log(decodedData.toString());
        var data = {
          "data": decodedData,
          "status": 1,
        };
        return data;
      } else {
        log("Else Condition >> Api failed");
        var data = {
          "data": null,
          "status": 0,
        };
        return data;
      }
    } catch (e) {
      log("$e");
    }
  }

  //for post
  static postData({
    required String endPoint,
    Map<String, String>? header,
    required Map<String, dynamic> body,
  }) async {
    log("Api-helper>postData");
    log("$body");
    final url = Uri.parse(AppConfig.baseurl + endPoint);
    try {
      var response = await http.post(url, body: body);
      log("Api Called => status code=${response.statusCode}");
      if (response.statusCode == 200) {
        var data = response.body;
        var decodedData = jsonDecode(data);
        return decodedData;
      } else {
        log("Else Condition -> Api failed");
        var data = response.body;
        var decodedData = jsonDecode(data);
        return decodedData;
      }
    } catch (e) {
      log("$e");
    }
  }

  static postBillData({
    required String endPoint,
    Map<String, String>? header,
    required Map<String, dynamic> body,
  }) async {
    log("Api-helper>postBillData");
    log("$body");
    final url = Uri.parse(AppConfig.baseurl + endPoint);
    log("$url");
    try {
      var response = await http.post(url, body: body);
      log("Api Called => status code=${response.statusCode}");
      if (response.statusCode == 201) {
        var resdata = response.body;
        var decodedData = jsonDecode(resdata);
        var data={
          "status":1,
          "data":decodedData
        };
        return data;
      } else if (response.statusCode == 203) {
        var resdata = response.body;
        var decodedData = jsonDecode(resdata);
        var data={
          "status":1,
          "data":decodedData
        };
        return data;
      } else if (response.statusCode == 400) {
        var resdata = response.body;
        var decodedData = jsonDecode(resdata);
        var data={
          "status":1,
          "data":decodedData
        };
        return data;
      } else {
        log("Else Condition -> Api failed");
        var resdata = response.body;
        var decodedData = jsonDecode(resdata);
        var data={
          "status":0,
          "data":decodedData
        };
        return data;
      }
    } catch (e) {
      var error = e.toString();
      log("++++++++++++$error");
      rethrow;
    }
  }
}
