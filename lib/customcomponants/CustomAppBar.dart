import 'package:flutter/material.dart';

import '../constants/AppColor.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  final bool centerTitle;
  final bool showBackButton; // Added boolean to control back button visibility

  const CustomAppBar({
    Key? key,
    required this.title,
    this.actions = const [],
    this.centerTitle = false,
    this.showBackButton = true, // Default value to hide back button
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(

      backgroundColor: AppColor.pink,
      leading: showBackButton ? IconButton(
        icon: Icon(Icons.arrow_back, color: AppColor.white,),
        onPressed: () {
          Navigator.of(context).pop(); // Pop the current route when back button is pressed
        },
      ) : null,
      title: Text(
        title,
        textAlign: centerTitle ? TextAlign.center : TextAlign.start,
       style: TextStyle(color: AppColor.white),
      ),
      centerTitle: centerTitle,
      actions: actions,
    );
  }

  @override
  //Size get preferredSize => Size.fromHeight(kToolbarHeight);
  Size get preferredSize => Size.fromHeight(45);
}