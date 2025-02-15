import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:nyewadotid/src/components/global/index.dart';
import 'package:nyewadotid/src/components/textformfield/underline_textformfield.dart';
import 'package:nyewadotid/src/components/textsyle/index.dart';

class ForgotPasswordProvider extends StatefulWidget {
  const ForgotPasswordProvider({super.key});

  @override
  State<ForgotPasswordProvider> createState() => _ForgotPasswordProviderState();
}

class _ForgotPasswordProviderState extends State<ForgotPasswordProvider> {
  GlobalTextStyle textStyle = GlobalTextStyle();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text("Lupa Kata Sandi Provider"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Image.asset('assets/images/forgot.png', width: orientation == Orientation.portrait ? size.width / 2 : size.width / 7),
                        AutoSizeText("I lost my password", style: textStyle.defaultTextStyleBold(), maxLines: 1,minFontSize: 20, maxFontSize: 25, overflow: TextOverflow.fade),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: orientation == Orientation.portrait ? size.width : size.width / 2,
                          child: AutoSizeText("Inputkan alamat email yang telah didaftarkan sebelumnya oleh admin untuk dapat mengirim kode OTP", style: textStyle.defaultTextStyleMedium(color: Colors.black45), overflow: TextOverflow.clip, maxFontSize: 17, minFontSize: 14, textAlign: TextAlign.center,))
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          width: orientation == Orientation.portrait ? double.infinity : size.width / 2,
                          child: UnderlineTextformfield(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            label: "Email",
                            iconData: EvaIcons.email_outline,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: orientation == Orientation.portrait ? double.infinity : size.width / 2,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: GlobalVariable.secondaryColor,
                      ),
                      onPressed: (){
                        Get.back();
                      }, child: Text("Kirim kode OTP", style: textStyle.defaultTextStyleMedium(fontSize: 16, color: Colors.white))
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}