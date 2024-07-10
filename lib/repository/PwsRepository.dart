import 'dart:convert';

import 'package:dummymvvmapp/models/PwsPendingapprovalmodal.dart';
import 'package:dummymvvmapp/sharedpreference/PreferenceUtils.dart';

import '../data/network/network_api_services.dart';

class PwsRepository {

  final NetworkApiServices _apiServices = NetworkApiServices();

  Future pwsrepocall() async {
    try {
      var token = PreferenceUtils.getString("usertoken").toString();
      print("tokenizer" + token);
      //var token = "6973dc2d-b6f2-4bb1-a2c1-e74b684f86be";
      var url = 'https://ejalshakti.gov.in/krcpwa/api/JJM_Mobile/GetGeotaggedWaterSource?VillageId=174438&StateId=17&UserId=6677&Status=1';

      var response = await _apiServices.getGetApiResponse(url, token.toString())
          .timeout(Duration(seconds: 60));
      return PwsPendingapprovalmodal.fromJson(response);

    } catch (e) {
      print('Error in pwsrepocall: $e');
      rethrow;
    }
  }
}

