import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:nyewadotid/src/components/button/cupertino_button.dart';
import 'package:nyewadotid/src/components/button/elevated_button.dart';
import 'package:nyewadotid/src/components/global/index.dart';
import 'package:nyewadotid/src/components/textformfield/underline_textformfield.dart';
import 'package:nyewadotid/src/components/textsyle/index.dart';
import 'package:nyewadotid/src/views/customers/authentications/forgot.dart';
import 'package:nyewadotid/src/views/customers/authentications/signup.dart';
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
          title: const Text("Sign in Client"),
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
                        AutoSizeText("Masuk dengan akun customer yang telah anda daftarkan sebelumnya", style: textStyle.defaultTextStyleMedium(color: Colors.black45), overflow: TextOverflow.clip, maxFontSize: 17, minFontSize: 14, textAlign: TextAlign.center,)
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
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
                        const SizedBox(height: 15),
                        SizedBox(
                          width: orientation == Orientation.portrait ? double.infinity : size.width / 2,
                          child: UnderlineTextformfield(
                            controller: passwordController,
                            isPasswordField: true,
                            keyboardType: TextInputType.visiblePassword,
                            label: "Kata Sandi",
                            iconData: EvaIcons.lock_outline,
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
                        child: kDefaultElevatedButton(
                          onPressed: (){
                            Get.to(() => const MainPage());
                          },
                          title: "Sign In"
                        )
                      ),
                      const SizedBox(height: 7),
                      SizedBox(
                        width: orientation == Orientation.portrait ? double.infinity : size.width / 2,
                        child: kDefaultElevatedButtonIcon(
                          backgroundColor: Colors.blue,
                          icon: Bootstrap.google,
                          title: "Sign in with Google",
                          onPressed: (){}
                        )
                      ),
                      const SizedBox(height: 7),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Belum punya akun?", style: textStyle.defaultTextStyleMedium(fontSize: 14, color: Colors.black54)),
                          const SizedBox(width: 5),
                          kDefaultCupertinoTextButton(
                            onPressed: (){
                              Get.to(() => const SignUpCustomer());
                            },
                            textColor: GlobalVariable.secondaryColor,
                            title: "Buat Akun"
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Lupa Kata Sandi?", style: textStyle.defaultTextStyleMedium(fontSize: 14, color: Colors.black54)),
            const SizedBox(width: 5),
            kDefaultCupertinoTextButton(
              onPressed: (){
                Get.to(() => const ForgotPasswordCustomer());
              },
              textColor: GlobalVariable.secondaryColor,
              title: "Reset"
            )
          ],
        )
      ),
    );
  }
}