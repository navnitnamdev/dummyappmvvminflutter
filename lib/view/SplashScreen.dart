import 'dart:async';

import 'package:flutter/material.dart';

import '../sharedpreference/PreferenceUtils.dart';
import 'DashBoard.dart';
import 'Login.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      if (PreferenceUtils.getString("usertoken").toString() == "b2469c01-31df-424b-bd91-4049c1bc093f") {
        //if(box.read('UserToken').toString() == "null") {
        //print("usertoken  >"+box.read('UserToken').toString());
        //Get.off(Dashboard(stateid: box.read("stateid"),userid: box.read("userid"),usertoken: box.read("UserToken").toString()));
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => DashBoard()));
        //Get.offAll(OTPScreen());

        //Get.off(LoginScreen());
      } else {
        // Get.off(LoginScreen());
        /*Get.offAll(Dashboard(
          stateid: box.read("stateid"),
          userid: box.read("userid"),
          usertoken: box.read("UserToken").toString(),
        ));*/
        //  Get.offAll(Dashboard(stateid: box.read("stateid"), userid: box.read("userid"), usertoken: box.read("UserToken"), first: true,));
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Login())); // Get.offAll(VillageListScreen(totalofflinevillage:box.read("TotalOfflineVillage")));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Center(
            child: Text(
          "Splash Screen dummy app\n for provider mvvm",
          style: TextStyle(fontSize: 16),
        )),
      ),
    );
  }
}
