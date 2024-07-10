import 'package:dummymvvmapp/models/SIBGeotagmodal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/AppColor.dart';
import '../data/network/ConnectivityService.dart';
import '../repository/SibRepository.dart';

class SibApproveViewModal extends ChangeNotifier {
  ConnectivityService connectivityService;
  final SibRepository sibRepository;
  SibApproveViewModal({required this.sibRepository , required this.connectivityService });
  SibGeotagmodal? sibdatalist;
  bool progressloader = false;
  bool _isDisposed = false;

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  Future<void> sibdataviewmodalfatchdatamethod(BuildContext context) async {


    if (_isDisposed) return;
    progressloader = true;
    notifyListeners();

    try {
      sibdatalist = await sibRepository.sibmethodfromrepocall();
      print("Listing_sib: $sibdatalist");
    } catch (e, stackTrace ) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        backgroundColor: AppColor.red,
      ));

      print('StackTrace: $stackTrace');
    } finally {
      if (!_isDisposed) {
        progressloader = false;
        notifyListeners();
      }
    }
  }

}