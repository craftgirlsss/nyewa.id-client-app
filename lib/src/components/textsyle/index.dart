import 'package:flutter/material.dart';

class GlobalTextStyle {

  // Default Text Light
  TextStyle defaultTextStyle({Color? color, double? fontSize}){
    return TextStyle(
      overflow: TextOverflow.ellipsis,
      fontSize: fontSize ?? 13,
      fontFamily: "Poppins-Light",
      color: color ?? Colors.black,

    );
  }

  // Default Text Medium
  TextStyle defaultTextStyleMedium({Color? color, double? fontSize}){
    return TextStyle(
      overflow: TextOverflow.ellipsis,
      fontSize: fontSize ?? 13,
      fontFamily: "Poppins-Medium",
      color: color ?? Colors.black,

    );
  }

  // Default Text Medium
  TextStyle defaultTextStyleBold({Color? color, double? fontSize}){
    return TextStyle(
      overflow: TextOverflow.ellipsis,
      fontSize: fontSize ?? 15,
      fontFamily: "Poppins-Bold",
      color: color ?? Colors.black,

    );
  }
}