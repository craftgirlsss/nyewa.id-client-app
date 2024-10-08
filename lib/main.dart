import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyewadotid/src/components/global/index.dart';
import 'package:nyewadotid/src/components/textsyle/index.dart';
import 'package:nyewadotid/src/views/auth/introduction_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final globalVariable = GlobalVariable();
  final textStyle = GlobalTextStyle();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'nyewa.id',
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStatePropertyAll(textStyle.defaultTextStyleBold(color: globalVariable.secondaryColor))
          )
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: textStyle.defaultTextStyleBold(fontSize: 18, color: globalVariable.secondaryColor),
          iconTheme: IconThemeData(
            color: globalVariable.secondaryColor,
          )
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const IntroductionScreen(),
    );
  }
}