import 'package:flutter/cupertino.dart';

class CustomCupertinoBottomSheet {
  
  static const double kItemExtent = 32.0;
  
  // ActionSheet
  static void cupertinoModalPopupsActionSheet(BuildContext context, {Widget? widget}){
    showCupertinoModalPopup<void>(
      context: context,
      builder: (context) => widget!,
    );
  }

  // CupertinoPicker
  static void cupertinoModalPopupsPicker(BuildContext context, {Widget? widget}){
    showCupertinoModalPopup<void>(
      context: context,
      builder: (context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(top: false, child: widget!),
      ),
    );
  }
}