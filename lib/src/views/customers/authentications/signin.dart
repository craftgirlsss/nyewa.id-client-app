import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:nyewadotid/src/components/global/index.dart';
import 'package:nyewadotid/src/components/textsyle/index.dart';
import 'package:nyewadotid/src/views/customers/authentications/forgot.dart';
import '../dashboards/mainpage.dart';

class SignInCustomer extends StatefulWidget {
  const SignInCustomer({super.key});

  @override
  State<SignInCustomer> createState() => _SignInCustomerState();
}

class _SignInCustomerState extends State<SignInCustomer> {
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
          title: const Text("Sign in"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Image.asset('assets/images/world2.jpg', width: orientation == Orientation.portrait ? size.width / 2 : size.width / 7),
                        AutoSizeText("Nyewa jasa bisa semudah ini", style: textStyle.defaultTextStyleBold(), maxLines: 1, minFontSize: 20, maxFontSize: 25, overflow: TextOverflow.fade),
                        const SizedBox(height: 10),
                        AutoSizeText("Masuk dengan akun yang telah anda daftarkan sebelumnya", style: textStyle.defaultTextStyleMedium(color: Colors.black45), overflow: TextOverflow.clip, maxFontSize: 17, minFontSize: 14, textAlign: TextAlign.center,)
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          width: orientation == Orientation.portrait ? double.infinity : size.width / 2,
                          child: TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: GlobalVariable.secondaryColor)),
                              label: Text("Email", style: textStyle.defaultTextStyleMedium(color: GlobalVariable.secondaryColor, fontSize: 16)),
                              prefixIcon: Icon(Icons.email, color: GlobalVariable.secondaryColor)
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          width: orientation == Orientation.portrait ? double.infinity : size.width / 2,
                          child: TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: GlobalVariable.secondaryColor)),
                              label: Text("Password", style: textStyle.defaultTextStyleMedium(color: GlobalVariable.secondaryColor, fontSize: 16)),
                              prefixIcon: Icon(Icons.lock, color: GlobalVariable.secondaryColor)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Column(
                    children: [
                      SizedBox(
                        width: orientation == Orientation.portrait ? double.infinity : size.width / 2,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: GlobalVariable.secondaryColor,
                          ),
                          onPressed: (){
                            Get.to(() => const MainPage());
                          }, child: Text("Sign in", style: textStyle.defaultTextStyleMedium(fontSize: 16, color: Colors.white))
                        ),
                      ),
                      const SizedBox(height: 7),
                      SizedBox(
                        width: orientation == Orientation.portrait ? double.infinity : size.width / 2,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.blue,
                          ),
                          onPressed: (){

                          },
                          icon: const Icon(Bootstrap.google, color: Colors.white, size: 20,),
                          label: Text("Sign in with Google", style: textStyle.defaultTextStyleMedium(fontSize: 16, color: Colors.white))
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: CupertinoButton(
          padding: EdgeInsets.zero,
          child: AutoSizeText("Lupa Password? Reset", style: textStyle.defaultTextStyleMedium(color: GlobalVariable.secondaryColor), minFontSize: 16, maxFontSize: 18), onPressed: (){
          Get.to(() => const ForgotPasswordCustomer());
        })
      ),
    );
  }
}