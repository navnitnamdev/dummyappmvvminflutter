import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import '../data/network/network_api_services.dart';
import '../utils/AppUrl.dart';

class LoginRepository {

  final NetworkApiServices _apiServices = NetworkApiServices();
    Future<dynamic> login(dynamic data) async {
    try {
   var response = await _apiServices.getPostApiResponse(AppUrl.login , data  ).timeout(Duration(seconds: 5));
print("response_loginrepo"+response.toString());
     return response;
    } catch (e) {
      rethrow;
    }
  }
}