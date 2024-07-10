import 'package:dummymvvmapp/models/PwsPendingapprovalmodal.dart';
import 'package:dummymvvmapp/repository/PwsRepository.dart';
import 'package:flutter/cupertino.dart';

class PwsListViewmodal extends ChangeNotifier {


  final PwsRepository pwsRepository;

  PwsListViewmodal({required this.pwsRepository});

  PwsPendingapprovalmodal? pwslist;
  bool progressloader = false;
  bool _isDisposed = false;
  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

Future<void> fetchUsers() async {
  if (_isDisposed) return;
  progressloader = true;
    notifyListeners();
    try {
      pwslist = await pwsRepository.pwsrepocall();
      print("Listing: $pwslist");
    } catch (e, stackTrace) {
      print('Exception in fetchUsers: $e');
      print('StackTrace: $stackTrace');
    } finally {
      progressloader = false;
      notifyListeners();
    }
  }
}