import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyewadotid/src/components/global/index.dart';
import 'package:nyewadotid/src/components/textsyle/index.dart';
import 'package:nyewadotid/src/views/utilities/introduction_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
            textStyle: WidgetStatePropertyAll(textStyle.defaultTextStyleBold(color: GlobalVariable.secondaryColor))
          )
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: textStyle.defaultTextStyleBold(fontSize: 18, color: GlobalVariable.secondaryColor),
          iconTheme: const IconThemeData(
            color: GlobalVariable.secondaryColor,
          )
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const IntroductionScreen(),
    );
  }
}