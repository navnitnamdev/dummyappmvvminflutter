import 'package:dummymvvmapp/viewmodal/SibApproveViewModal.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

import '../constants/AppColor.dart';
import '../constants/TextFile.dart';
import '../customcomponants/CustomAppBar.dart';
import '../customcomponants/not_avaible_photo.dart';
import '../sharedpreference/PreferenceUtils.dart';
import '../utils/AppUrl.dart';
import 'Login.dart';

class SibPending extends StatefulWidget {
  const SibPending({super.key});

  @override
  State<SibPending> createState() => _SibPendingState();
}

class _SibPendingState extends State<SibPending> {

  late SibApproveViewModal viewModel;



  @override
  void initState() {
    super.initState();
    // Call the method using Provider.of with listen: false

       viewModel = Provider.of<SibApproveViewModal>(context, listen: false);
      viewModel.sibdataviewmodalfatchdatamethod(context);

  }
  @override
  Widget build(BuildContext context) {

  /*   viewModel = Provider.of<SibApproveViewModal>(context, listen: false);
    viewModel.sibdataviewmodalfatchdatamethod(context);
*/



    return   Scaffold(
      backgroundColor: AppColor.white,
      appBar: CustomAppBar(
        showBackButton: true,
        title: TextFile.sibpapprove,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
                onTap: () {

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
                  PreferenceUtils.remove(TextFile.sibpapprove);
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
      body: Consumer<SibApproveViewModal>(
        builder: (context, viewModel, child) {
          if (viewModel.progressloader) {
            return Center(child: CircularProgressIndicator());
          }

          if (viewModel.sibdatalist == null) {
            print("listing_sibpage"+ viewModel.sibdatalist.toString());
            return Center(child: Text('No data available'));
          }

          return  ListView.builder(
            itemCount: viewModel.sibdatalist!.result!.length,
            itemBuilder: (context, int index) {
              final sibitem = viewModel.sibdatalist!.result![index];
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(sibitem.villageName.toString()),
                        Text(sibitem.sourceName.toString()),
                      ],
                    ),
                  ),
                  sibitem.imageUrl.toString()=="" ?  const NotAvaiblePhoto(
                    height: 40,
                    width: 40,
                  ):  Container(
                    width: 40,
                    height: 40,
                    child: InteractiveViewer(
                      minScale: 0.1,
                      maxScale: 10,
                      child: Image.memory(
                        AppUrl.convertBase64Image(sibitem.imageUrl.toString()),
                        gaplessPlayback: true,
                      ),
                    ),
                  ),
                ],
                
              );
            },
          );
        },
      ),
    );
  }
/*  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }*/
}
