import 'package:flutter/cupertino.dart';
import 'package:nyewadotid/src/components/global/index.dart';
import 'package:nyewadotid/src/components/textsyle/index.dart';

final textStyle = GlobalTextStyle();

CupertinoButton kDefaultCupertinoButton({String? title, Function()? onPressed, Color? textColor, Color? backgroundColor}){
  return CupertinoButton(
    color: backgroundColor ?? GlobalVariable.secondaryColor,
    onPressed: onPressed,
    child: Text(title ?? "OK", style: textStyle.defaultTextStyleBold(color: textColor ?? CupertinoColors.white))
  );
}

CupertinoButton kDefaultCupertinoTextButton({String? title, Function()? onPressed, Color? textColor}){
  return CupertinoButton(
    padding: EdgeInsets.zero,
    onPressed: onPressed,
    child: Text(title ?? "OK", style: textStyle.defaultTextStyleBold(color: textColor ?? CupertinoColors.white))
  );
}

CupertinoButton kDefaultCupertinoChild({Function()? onPressed, Widget? child}){
  return CupertinoButton(
    padding: EdgeInsets.zero,
    onPressed: onPressed,
    child: child ?? const SizedBox()
  );
}