import 'dart:io';

import 'package:dummymvvmapp/constants/AppColor.dart';
import 'package:dummymvvmapp/constants/StylleFile.dart';
import 'package:dummymvvmapp/constants/TextFile.dart';
import 'package:dummymvvmapp/view/ChangeVariablevaluestateless.dart';
import 'package:dummymvvmapp/viewmodal/PwsViewModal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../customcomponants/CustomAppBar.dart';
import '../customcomponants/not_avaible_photo.dart';
import '../sharedpreference/PreferenceUtils.dart';
import '../utils/AppUrl.dart';
import '../viewmodal/SibApproveViewModal.dart';
import 'Login.dart';
import 'SibPending.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  late SibApproveViewModal viewModel;

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<PwsListViewmodal>(context, listen: false);
    userViewModel.fetchUsers();

    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: CustomAppBar(
        showBackButton: false,
        title: TextFile.dashboard,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
                onTap: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) => SibPending()));

                },
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
                onTap: () {
                  PreferenceUtils.remove(TextFile.dashboard);
                  PreferenceUtils.clear();

                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Login()));
                },
                child: const Icon(
                  Icons.logout,
                  color: Colors.white,
                )),
          ),
        ],
      ),
      body: Consumer<PwsListViewmodal>(
        builder: (context, viewModel, child) {
          if (viewModel.progressloader) {
            return Center(child: CircularProgressIndicator());
          }

          if (viewModel.pwslist == null) {
            return Center(child: Text('No data available'));
          }

          return ListView.builder(
            itemCount: viewModel.pwslist!.result.length,
            itemBuilder: (context, index) {
              final pwsItem = viewModel.pwslist!.result[index];
              return GestureDetector(
                onTap: (){
                  //ChangeVariableValuestateless

                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ChangeVariableValuestateless(yourData:5)));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(pwsItem.villageName.toString()),
                          Text(pwsItem.sourceName.toString()),
                        ],
                      ),
                    ),
                    pwsItem.imageUrl.toString() == ""
                        ? const NotAvaiblePhoto(
                            height: 40,
                            width: 40,
                          )
                        : Container(
                            width: 60,
                            height: 60,
                            child: InteractiveViewer(
                              minScale: 0.1,
                              maxScale: 10,
                              child: Image.memory(
                                AppUrl.convertBase64Image(
                                    pwsItem.imageUrl.toString()),
                                gaplessPlayback: true,
                              ),
                            ),
                          ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
