import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyewadotid/src/components/global/index.dart';
import 'package:nyewadotid/src/components/textsyle/index.dart';
import 'package:nyewadotid/src/views/auth/signin.dart';
import 'package:nyewadotid/src/views/auth/signup.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  GlobalTextStyle textStyle = GlobalTextStyle();
  GlobalVariable globalVariable = GlobalVariable();
  var signupSelected = true.obs;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: Container(
        // alignment: Alignment.centerRight,
        // width: orientation == Orientation.portrait ? size.width : size.width / 2,
        // height: orientation == Orientation.portrait ? size.height : size.width / 2,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          )
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 35),
                width: orientation == Orientation.portrait ? size.width : size.width / 2,
                height: orientation == Orientation.portrait ? size.height / 2.2 : size.height,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20)],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35)
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText("Welcome to", style: textStyle.defaultTextStyleBold(), maxLines: 1, minFontSize: 40, maxFontSize: 45, overflow: TextOverflow.fade),
                          AutoSizeText("nyewa.id", style: textStyle.defaultTextStyleBold(color: globalVariable.secondaryColor), maxLines: 2, minFontSize: 45, maxFontSize: 50, overflow: TextOverflow.fade),
                          const SizedBox(height: 10),
                          AutoSizeText("Cari jasa layanan yang anda butuhkan dengan mudah dimana saja", style: textStyle.defaultTextStyleMedium(color: Colors.black45), overflow: TextOverflow.clip, maxFontSize: 17, minFontSize: 14)
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        // borderRadius: BorderRadius.circular(30),
                        // border: Border.all(color: Colors.black45)
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Obx(() => ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                side: BorderSide(
                                  color: signupSelected.value ? globalVariable.secondaryColor : Colors.black12
                                ),
                                elevation: 0,
                                backgroundColor: signupSelected.value ? globalVariable.secondaryColor : Colors.white,
                              ),
                              onPressed: (){
                                signupSelected.value = true;
                                Get.to(() => const SignUp());
                              }, child: Text("Sign up", style: textStyle.defaultTextStyleMedium(fontSize: 16, color: signupSelected.value ? Colors.white : Colors.black))
                              ),
                            )
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Obx(() => ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                side: BorderSide(
                                  color: signupSelected.value ? Colors.black12 : globalVariable.secondaryColor
                                ),
                                elevation: 0,
                                backgroundColor: signupSelected.value ? Colors.white : globalVariable.secondaryColor,
                              ),
                              onPressed: (){
                                signupSelected.value = false;
                                Get.to(() => const SignIn());
                              }, child: Text("Sign in", style: textStyle.defaultTextStyleMedium(fontSize: 16, color: signupSelected.value ? Colors.black : Colors.white))
                              ),
                            )
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}