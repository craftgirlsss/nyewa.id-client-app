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
    icon: Icon(icon ?? Icons.apple, color: textColor ?? Colors.white, size: 20),
    label: Text(title ?? "OK", style: textStyle.defaultTextStyleBold(color: textColor ?? Colors.white))
  );
}

ElevatedButton kDefaultElevatedButtonOutline({String? title, Function()? onPressed, Color? textColor, Color? backgroundColor, IconData? icon}){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColor ?? Colors.white,
      side: BorderSide(
        color: textColor ?? Colors.black45
      ),
      elevation: 0,
    ),
    onPressed: onPressed,
    child: Text(title ?? "OK", style: textStyle.defaultTextStyleBold(color: textColor ?? Colors.black45))
  );
}


// Square rounded button
ElevatedButton kDefaultElevatedButtonSquare({String? title, Function()? onPressed, Color? textColor, Color? backgroundColor}){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      backgroundColor: backgroundColor ?? GlobalVariable.secondaryColor
    ),
    onPressed: onPressed, 
    child: Text(title ?? "OK", style: TextStyle(color: textColor ?? Colors.white))
  );
}

// Square outlined rounded button
ElevatedButton kDefaultElevatedButtonOutlineSquare({String? title, Function()? onPressed, Color? textColor, Color? backgroundColor, IconData? icon}){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColor ?? Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      side: BorderSide(
        color: textColor ?? Colors.black45
      ),
      elevation: 0,
    ),
    onPressed: onPressed,
    child: Text(title ?? "OK", style: TextStyle(color: textColor ?? Colors.black45))
  );
}