import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:nyewadotid/src/components/global/index.dart';

class MenuListtile {
  static ListTile menuListtile({String? menuName, IconData? leadingIcon, Function()? onPressed, bool? isLastMenu}){
    return ListTile(
      onTap: onPressed,
      dense: true,
      shape: Border(
        bottom: isLastMenu == true ? BorderSide.none : const BorderSide(
          color: GlobalVariable.secondaryColor
        ),
      ),
      leading: Icon(leadingIcon ?? Bootstrap.ui_checks_grid, color: GlobalVariable.secondaryColor),
      title: Text(menuName ?? "Menu", style: const TextStyle(color: GlobalVariable.secondaryColor, fontSize: 14)),
      trailing: const Icon(CupertinoIcons.chevron_forward, color: GlobalVariable.secondaryColor, size: 20),
    );
  }
}