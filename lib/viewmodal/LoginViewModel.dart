import 'package:dummymvvmapp/constants/StylleFile.dart';
import 'package:dummymvvmapp/repository/LoginRepository.dart';
import 'package:dummymvvmapp/view/DashBoard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../sharedpreference/PreferenceUtils.dart';

class LoginViewModel with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
 final LoginRepository loginrepo;

  LoginViewModel({required this.loginrepo});

  Future<void> loginApi(dynamic data, BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    loginrepo.login(data).then((value) async {
      // Ensure value is treated as a Map<String, dynamic>
      if (value is Map<String, dynamic> && value['Status'] == true) {
        print("valueof_: $value");
        var token = value["Token"];
        print("Login_Token: $token");
        await PreferenceUtils.setString("usertoken", token );
        await PreferenceUtils.setString("userid", value['Userid'].toString());
        await PreferenceUtils.setString("stateid", value['StateId'].toString());
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DashBoard()),
        );

        print("Login Token Stored: $token");
        StyleFile.ShowMessageApiSuccess(context, "Success");
      } else {
        StyleFile.showmessageapierrors(context, value.toString());
      }
    }).catchError((error) {
      StyleFile.showmessageapierrors(context, error.toString());
      print("valueof_error: $error!");
    }).whenComplete(() {
      _isLoading = false;
      notifyListeners();
    });
  }
}
