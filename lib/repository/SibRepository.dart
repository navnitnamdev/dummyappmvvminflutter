import 'package:dummymvvmapp/models/SIBGeotagmodal.dart';

import '../data/network/network_api_services.dart';
import '../sharedpreference/PreferenceUtils.dart';

/*
class SibRepository {

  final NetworkApiServices _apiServices = NetworkApiServices();

  Future sibrepomethodcall() async {
    try {
      var token = PreferenceUtils.getString("usertoken").toString();
      print("tokenizer" + token);
      //var token = "6973dc2d-b6f2-4bb1-a2c1-e74b684f86be";
     // var url = 'https://ejalshakti.gov.in/krcpwa/api/JJM_Mobile/GetGeotaggedWaterSource?VillageId=174438&StateId=17&UserId=6677&Status=1';
      var url = 'https://ejalshakti.gov.in/krcpwa/api/JJM_Mobile/GetGeotaggedInformationBoard?VillageId=174438&StateId=17&UserId=6677&Status=1';
      var response = await _apiServices.getGetApiResponse(url, token.toString())
          .timeout(Duration(seconds: 10));
      return SibGeotagmodal.fromJson(response);

    } catch (e) {
      print('Error in pwsrepocall: $e');
      rethrow;
    }
  }
}*/

class SibRepository {

  final NetworkApiServices _apiServices = NetworkApiServices();

  Future sibmethodfromrepocall() async {
    try {
      var token = PreferenceUtils.getString("usertoken").toString();
      print("tokenizer_sib" + token);
      //var token = "6973dc2d-b6f2-4bb1-a2c1-e74b684f86be";
      var url = 'https://ejalshakti.gov.in/krcpwa/api/JJM_Mobile/GetGeotaggedInformationBoard?VillageId=174438&StateId=17&UserId=6677&Status=1';

      var response = await _apiServices.getGetApiResponse(url, token.toString())
          .timeout(Duration(seconds: 120));
      return SibGeotagmodal.fromJson(response);

    } catch (e) {
      print('Error in pwsrepocall: $e');
      rethrow;
    }
  }
}
