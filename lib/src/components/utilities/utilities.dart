import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:nyewadotid/src/components/global/index.dart';
import 'package:nyewadotid/src/components/textsyle/index.dart';

class Utilities {
  final globalVariable = GlobalVariable();
  final textStyle = GlobalTextStyle();

  Widget cardTitle({String? title}){
    return Row(
      children: [
        Container(
          width: 4,
          height: 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: globalVariable.secondaryColor
          ),
        ),
        const SizedBox(width: 8),
        AutoSizeText(title ?? "Unknown Title", style: textStyle.defaultTextStyleMedium(), minFontSize: 16, maxFontSize: 17, maxLines: 1, overflow: TextOverflow.clip)
      ],
    );
  }
}