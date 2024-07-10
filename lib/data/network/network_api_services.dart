// ignore_for_file: file_names

import 'dart:convert';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../constants/StylleFile.dart';
import '../app_exceptions.dart';
import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  dynamic responseJson;

  @override
  Future<dynamic> getGetApiResponse(String url, String userToken) async {

    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'APIKey': userToken,
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response body_get: ${response.body}');

      if (response.statusCode == 200) {
        responseJson = _returnResponse(response);
        print("jsonres: " + responseJson.toString());
        return json.decode(response.body);
      } else {
        throw HttpException('Failed to load data: ${response.statusCode}');

      }
    } on SocketException {
      throw FetchDataException('No Internet Connection available');
    } on HttpException catch (e) {
      throw e;
    } catch (e) {
      print('Error in getGetApiResponse: $e');
      throw Exception('Failed to load data');
    }
  }







  @override
  Future<Map<String, dynamic>> getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;


    try {
      http.Response response = await http
          .post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(data),).timeout(const Duration(seconds: 120));

      responseJson = _returnResponse(response);
      print("jsonres_sib: " + responseJson.toString());
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } on HttpException catch (e) {
      throw e;
    } catch (e) {
      print('Error in getGetApiResponse: $e');
      throw Exception('Failed to load data');
    }
    return responseJson;
  }


  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        //StyleFile.showmessageapierrors(context, responseJson.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw BadRequestException(response.body.toString());
      case 500:
        throw BadRequestException(response.body.toString());
      default:
        throw FetchDataException(
            "Error accourded while communicating with server with status code ${response.statusCode}");
    }
  }



}

