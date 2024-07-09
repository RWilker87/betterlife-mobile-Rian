import 'dart:core';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenRepository {
  Dio dio = Dio();

  Future getUserData(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    var userId = prefs.getInt('id');
    var userToken = prefs.getString('token');

    if (userId == null || userToken == null) {
      return null;
    }
    try {
      var response = await dio.get(
        'baseUrl/users/',
        options: Options(headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $userToken"
        }),
      );
      if (response.statusCode == 200) {
        var dataList = response.data['users'] as List<dynamic>;

        return dataList;
      } else {
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }
}
