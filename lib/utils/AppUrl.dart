import 'dart:convert';

import 'package:flutter/foundation.dart';

class AppUrl {
  static String baseurl = "https://ejalshakti.gov.in/krcpwa/api/";

  // ignore: todo
  //TODO : "Sign up and add Your apiKey https://www.themoviedb.org/documentation/api."
  static var apiKey = '';


   static String login = baseurl+"JJM_Mobile/Login";
 //  static String pwsapproved = baseurl+"JJM_Mobile/GetGeotaggedWaterSource?VillageId=174438&StateId=17&UserId=6677&Status=1";
   static String pwsapproved = baseurl+"JJM_Mobile/GetGeotaggedWaterSource?VillageId=174438&StateId=17&UserId=6677&Status=1";

  static Uint8List convertBase64Image(String base64String) {
    return Base64Decoder().convert(base64String.split(',').last);
  }
}