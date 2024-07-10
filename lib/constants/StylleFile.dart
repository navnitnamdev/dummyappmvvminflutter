import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

import 'AppColor.dart';

class StyleFile {
  static void ShowMessageApiSuccess(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: AppColor.green,
    ));
  }

  static void showmessageapierrors(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: AppColor.red,
    ));
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          reverseAnimationCurve: Curves.easeOut,
          flushbarPosition: FlushbarPosition.TOP,
          positionOffset: 20,
          borderRadius: BorderRadius.circular(8),
          icon: const Icon(Icons.error),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          padding: const EdgeInsets.all(10),
          message: message,
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.red,
        )..show(context));
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text(message)));
  }

  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }


  static const TextColorWhiteSize14 = TextStyle(
      color: AppColor.black, fontSize: 14, fontWeight: FontWeight.w400);

  static const  TextColorWhiteSize16 = TextStyle(
      color: AppColor.black, fontSize: 16, fontWeight: FontWeight.bold);
  static const TextColorWhiteSize25 = TextStyle(
      color: AppColor.black, fontSize: 25, fontWeight: FontWeight.bold);
}
