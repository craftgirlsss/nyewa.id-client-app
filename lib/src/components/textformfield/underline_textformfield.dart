import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:nyewadotid/src/components/global/index.dart';
import 'package:nyewadotid/src/components/textsyle/index.dart';

class UnderlineTextformfield extends StatefulWidget {
  const UnderlineTextformfield({super.key, this.controller, this.keyboardType, this.label, this.errorText, this.enable, this.readOnly, this.onTap, this.iconData, this.isPasswordField});
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? label;
  final String? errorText;
  final bool? enable;
  final bool? readOnly;
  final IconData? iconData;
  final bool? isPasswordField;
  final Function()? onTap;

  @override
  State<UnderlineTextformfield> createState() => _UnderlineTextformfieldState();
}

class _UnderlineTextformfieldState extends State<UnderlineTextformfield> {
  GlobalTextStyle textStyle = GlobalTextStyle();
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPasswordField == true ? showPassword ? true : false : false,
      cursorColor: GlobalVariable.secondaryColor,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      controller: widget.controller,
      enabled: widget.enable ?? true,
      onTap: widget.readOnly == true ? widget.onTap : null,
      readOnly: widget.readOnly ?? false,
      style: textStyle.defaultTextStyleMedium(color: GlobalVariable.secondaryColor, fontSize: 14),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.errorText ?? 'Mohon isi ${widget.label}';
        }
        return null;
      },
      decoration: InputDecoration(
        suffixIcon: widget.isPasswordField == true ? CupertinoButton(
          onPressed: (){
            setState(() {
              showPassword = !showPassword;
            });
          },
          child: showPassword ? const Icon(EvaIcons.eye, color: GlobalVariable.secondaryColor) : const Icon(EvaIcons.eye_off, color: GlobalVariable.secondaryColor), 
        ) : const SizedBox(),
        border: const UnderlineInputBorder(borderSide: BorderSide(color: GlobalVariable.secondaryColor)),
        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: GlobalVariable.secondaryColor)),
        enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: GlobalVariable.secondaryColor)),
        label: Text(widget.label ?? "Label", style: textStyle.defaultTextStyleMedium(color: GlobalVariable.secondaryColor, fontSize: 14)),
        prefixIcon: Icon(widget.iconData ?? EvaIcons.email_outline, color: GlobalVariable.secondaryColor)
      ),
    );
  }
}