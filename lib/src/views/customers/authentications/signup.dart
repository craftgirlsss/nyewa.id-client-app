import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:nyewadotid/src/components/button/cupertino_button.dart';
import 'package:nyewadotid/src/components/global/index.dart';
import 'package:nyewadotid/src/components/textformfield/underline_textformfield.dart';
import 'package:nyewadotid/src/components/textsyle/index.dart';
import 'package:nyewadotid/src/views/customers/authentications/otp.dart';

class SignUpCustomer extends StatefulWidget {
  const SignUpCustomer({super.key});

  @override
  State<SignUpCustomer> createState() => _SignUpCustomerState();
}

class _SignUpCustomerState extends State<SignUpCustomer> {
  GlobalTextStyle textStyle = GlobalTextStyle();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
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
          title: const Text("Sign up Customer"),
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
                        AutoSizeText("Daftar sebagai customer. Mohon inputkan semua field yang dibutuhkan.", style: textStyle.defaultTextStyleMedium(color: Colors.black45), overflow: TextOverflow.clip, maxFontSize: 17, minFontSize: 14, textAlign: TextAlign.center,)
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
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            label: "Nama Lengkap",
                            iconData: EvaIcons.person_outline,
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          width: orientation == Orientation.portrait ? double.infinity : size.width / 2,
                          child: UnderlineTextformfield(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            label: "Nomor HP / WhatsApp",
                            iconData: Bootstrap.phone,
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          width: orientation == Orientation.portrait ? double.infinity : size.width / 2,
                          child: UnderlineTextformfield(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            label: "Email",
                            iconData: EvaIcons.email_outline,
                          ),
                        ),
                        const SizedBox(height: 5),
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
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: GlobalVariable.secondaryColor,
                          ),
                          onPressed: (){
                            if(_formKey.currentState!.validate()){
                              Get.to(() => OtpPageCustomer(email: emailController.text));
                            }
                          }, child: Text("Sign up", style: textStyle.defaultTextStyleMedium(fontSize: 16, color: Colors.white))
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
                          onPressed: (){},
                          icon: const Icon(Bootstrap.google, color: Colors.white, size: 20,),
                          label: Text("Sign up with Google", style: textStyle.defaultTextStyleMedium(fontSize: 16, color: Colors.white)
                          )
                        ),
                      ),
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
            Text("Sudah Punya Akun?", style: textStyle.defaultTextStyleMedium(fontSize: 14, color: Colors.black54)),
            const SizedBox(width: 5),
            kDefaultCupertinoTextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              textColor: GlobalVariable.secondaryColor,
              title: "Sign In"
            )
          ],
        )
      ),
    );
  }
}