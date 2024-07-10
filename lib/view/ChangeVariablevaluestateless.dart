import 'package:dummymvvmapp/customcomponants/CustomAppBar.dart';
import 'package:flutter/material.dart';



class ChangeVariableValuestateless extends StatelessWidget {
    int yourData=0;
  //ChangeVariableValuestateless({super.key});
  //ChangeVariableValuestateless(this.yourData);
  ChangeVariableValuestateless( { required int yourData} );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(yourData.toString()),
          ],
        ),
      ),
    );
  }
}