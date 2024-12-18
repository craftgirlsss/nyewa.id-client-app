import 'package:flutter/material.dart';
import 'package:nyewadotid/src/components/global/index.dart';
import 'package:nyewadotid/src/components/textsyle/index.dart';

final textStyle = GlobalTextStyle();

ElevatedButton kDefaultElevatedButton({String? title, Function()? onPressed, Color? textColor, Color? backgroundColor}){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColor ?? GlobalVariable.secondaryColor
    ),
    onPressed: onPressed, 
    child: Text(title ?? "OK", style: textStyle.defaultTextStyleBold(color: textColor ?? Colors.white))
  );
}

ElevatedButton kDefaultElevatedButtonIcon({String? title, Function()? onPressed, Color? textColor, Color? backgroundColor, IconData? icon}){
  return ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColor ?? GlobalVariable.secondaryColor
    ),
    onPressed: onPressed,
    icon: Icon(icon ?? Icons.apple, color: textColor ?? Colors.white),
    label: Text(title ?? "OK", style: textStyle.defaultTextStyleBold(color: textColor ?? Colors.white))
  );
}

ElevatedButton kDefaultElevatedButtonOutline({String? title, Function()? onPressed, Color? textColor, Color? backgroundColor, IconData? icon}){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      side: BorderSide(
        color: textColor ?? Colors.black45
      ),
      elevation: 0,
    ),
    onPressed: onPressed,
    child: Text(title ?? "OK", style: textStyle.defaultTextStyleBold(color: textColor ?? Colors.black45))
  );
}