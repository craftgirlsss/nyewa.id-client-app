import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyewadotid/src/components/alert/info_alert.dart';
import 'package:nyewadotid/src/components/global/index.dart';
import 'package:nyewadotid/src/components/textsyle/index.dart';
import 'package:nyewadotid/src/views/customers/authentications/signin.dart';
import 'package:nyewadotid/src/views/providers/authentications/signin.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  GlobalTextStyle textStyle = GlobalTextStyle();
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
                          AutoSizeText("nyewa.id", style: textStyle.defaultTextStyleBold(color: GlobalVariable.secondaryColor), maxLines: 2, minFontSize: 45, maxFontSize: 50, overflow: TextOverflow.fade),
                          const SizedBox(height: 10),
                          AutoSizeText("Cari jasa atau menjadi bagian dari penyedia layanan dengan mudah.", style: textStyle.defaultTextStyleMedium(color: Colors.black45), overflow: TextOverflow.clip, maxFontSize: 17, minFontSize: 14)
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                side: const BorderSide(
                                  color: GlobalVariable.secondaryColor
                                ),
                                elevation: 0,
                                backgroundColor: GlobalVariable.secondaryColor
                              ),
                              onPressed: (){
                                Get.to(() => const SignInCustomer());
                              }, child: Text("Client", style: textStyle.defaultTextStyleMedium(fontSize: 16, color: signupSelected.value ? Colors.white : Colors.black))
                            )
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                side: const BorderSide(
                                  color: Colors.black12
                                ),
                                elevation: 0,
                                backgroundColor: Colors.white
                              ),
                              onPressed: (){
                                Get.to(() => const SignInProvider());
                              }, 
                              child: Text("Provider", style: textStyle.defaultTextStyleMedium(fontSize: 16, color: signupSelected.value ? Colors.black : Colors.white))
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ),
            Positioned(
              top: 30,
              right: 0,
              child: CupertinoButton(
                onPressed: (){
                  alertInfo(context, title: "Informasi", content: """
1. Client untuk login calon customer yang dimana untuk mencari dan penyedia layanan jasa.
2. Customer untuk login calon penyedia jasa yang dimana untuk mengelola bisnis jasa.
""", withCancelButton: false);
                },
                child: const Icon(CupertinoIcons.info, color: GlobalVariable.secondaryColor),
              )
            )
          ],
        ),
      ),
    );
  }
}