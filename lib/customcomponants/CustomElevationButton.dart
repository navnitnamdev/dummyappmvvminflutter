import 'package:flutter/material.dart';

import '../constants/AppColor.dart';
class CustomElevationButton extends StatelessWidget {
  final Widget child;
  final double elevation;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color textcolor;

  CustomElevationButton({
    required this.child,
    this.elevation = 2.0,
    this.onPressed,
    required this.backgroundColor, // Now requires a background color
    required this.textcolor, // Now requires a background color
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed))
            return AppColor.green; // Color when the button is pressed
          return AppColor.elevationbuttoncolor;    // Default color
        }),
        elevation: MaterialStateProperty.all(elevation),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      onPressed: onPressed,
      child: DefaultTextStyle.merge(
        style: TextStyle(color: AppColor.elevationbuttontextcolor),
        child: child,
      ),
    );
  }
}