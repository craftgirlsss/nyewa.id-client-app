import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:nyewadotid/src/components/global/index.dart';
import 'package:nyewadotid/src/components/textsyle/index.dart';

class UnderlineTextformfield extends StatefulWidget {
  const UnderlineTextformfield({super.key, this.controller, this.keyboardType, this.label, this.errorText, this.enable, this.readOnly, this.onTap, this.iconData, this.isPasswordField, this.maxLines, this.minLines, this.addCopyAction, this.hintText, this.addSuffixButton, this.onTapSuffixButton, this.suffixIcon});
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? label;
  final String? hintText;
  final String? errorText;
  final bool? addSuffixButton;
  final IconData? suffixIcon;
  final Function()? onTapSuffixButton;
  final bool? enable;
  final bool? readOnly;
  final IconData? iconData;
  final bool? isPasswordField;
  final bool? addCopyAction;
  final Function()? onTap;
  final int? maxLines;
  final int? minLines;

  @override
  State<UnderlineTextformfield> createState() => _UnderlineTextformfieldState();
}

class _UnderlineTextformfieldState extends State<UnderlineTextformfield> {
  GlobalTextStyle textStyle = GlobalTextStyle();
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLines ?? 1,
      minLines: widget.minLines ?? 1,
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
        hintText: widget.hintText ?? "",
        hintStyle: TextStyle(color: GlobalVariable.secondaryColor.withOpacity(0.5), fontSize: 12),
        suffixIcon: widget.addSuffixButton == true ? CupertinoButton(
          onPressed: widget.onTapSuffixButton,
          child: Icon(widget.suffixIcon, color: GlobalVariable.secondaryColor)
        ) : widget.addCopyAction == true ? CupertinoButton(
          onPressed: () async {
            await Clipboard.setData(ClipboardData(text: widget.controller!.text)).then((result){
              Get.snackbar("Berhasil", "Berhasil copy Kode Promosi", backgroundColor: Colors.green, colorText: Colors.white);
            });
          },
          child: showPassword ? const Icon(Iconsax.copy_outline, color: GlobalVariable.secondaryColor) : const Icon(EvaIcons.eye_off, color: GlobalVariable.secondaryColor), 
        ) : widget.isPasswordField == true ? CupertinoButton(
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

class UnderlineTextformfieldCurrency extends StatefulWidget {
  const UnderlineTextformfieldCurrency({super.key, this.controller, this.label, this.errorText, this.enable, this.readOnly, this.onTap, this.iconData});
  final TextEditingController? controller;
  final String? label;
  final String? errorText;
  final bool? enable;
  final bool? readOnly;
  final IconData? iconData;
  final Function()? onTap;

  @override
  State<UnderlineTextformfieldCurrency> createState() => _UnderlineTextformfieldCurrencyState();
}

class _UnderlineTextformfieldCurrencyState extends State<UnderlineTextformfieldCurrency> {
  GlobalTextStyle textStyle = GlobalTextStyle();
  static const _locale = 'en';
  String? _formatNumber(String? s) => NumberFormat.decimalPattern(_locale).format(int.parse(s ?? '0'));

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: GlobalVariable.secondaryColor,
      keyboardType: TextInputType.number,
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
      onChanged: (string) {
        if(string.isNotEmpty){
          string = _formatNumber(string.replaceAll(',', '')) ?? '';
          widget.controller?.value = TextEditingValue(
            text: string,
            selection: TextSelection.collapsed(offset: string.length),
          );
        }
      },
      decoration: InputDecoration(
        prefix: Text("IDR ", style: textStyle.defaultTextStyleMedium(color: GlobalVariable.secondaryColor, fontSize: 14)),
        border: const UnderlineInputBorder(borderSide: BorderSide(color: GlobalVariable.secondaryColor)),
        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: GlobalVariable.secondaryColor)),
        enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: GlobalVariable.secondaryColor)),
        label: Text(widget.label ?? "Label", style: textStyle.defaultTextStyleMedium(color: GlobalVariable.secondaryColor, fontSize: 14)),
        prefixIcon: Icon(widget.iconData ?? EvaIcons.email_outline, color: GlobalVariable.secondaryColor)
      ),
    );
  }
}