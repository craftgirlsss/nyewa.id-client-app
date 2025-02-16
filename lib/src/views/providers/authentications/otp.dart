import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyewadotid/src/components/button/cupertino_button.dart';
import 'package:nyewadotid/src/components/global/index.dart';
import 'package:nyewadotid/src/components/textsyle/index.dart';
import 'package:nyewadotid/src/components/utilities/utilities.dart';
import 'package:nyewadotid/src/views/providers/authentications/signin.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPageProvider extends StatefulWidget {
  const OtpPageProvider({super.key, this.email});
  final String? email;

  @override
  State<OtpPageProvider> createState() => _OtpPageProviderState();
}

class _OtpPageProviderState extends State<OtpPageProvider> {
  GlobalTextStyle textStyle = GlobalTextStyle();

  RxInt countdowntime = 60.obs;
  RxBool isLoading = false.obs;
  String? otp;
  Timer? _timer;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (countdowntime.value == 0) {
        countdowntime(60);
        timer.cancel();
      } else {
        countdowntime.value--;
      }},
    );
  }

  // AuthenticationController authenticationController = Get.find();
  bool hasError = false;
  String currentText = "";
  TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () => startTimer());
  }

  @override
  void dispose() {
    _timer?.cancel();
    otpController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Utilities.defaultAnnotatedRegion(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: const Text("Konfirmasi Kode OTP Provider"),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(child: Image.asset('assets/images/otp.png', fit: BoxFit.cover, width: orientation == Orientation.portrait ? size.width / 1.5 : size.width / 6)),
                    const SizedBox(height: 30),
                    orientation == Orientation.portrait ? AutoSizeText("Verifikasi Kode OTP", style: textStyle.defaultTextStyleMedium(), minFontSize: 23, maxFontSize: 27) : Center(child: AutoSizeText("Verifikasi Kode OTP", style: textStyle.defaultTextStyleMedium(), minFontSize: 23, maxFontSize: 27)),
                    const SizedBox(height: 10),
                    orientation == Orientation.portrait ? AutoSizeText("Masukkan kode OTP yang telah kami kirimkan ke alamat email ${widget.email} yang telah anda daftarkan", style: textStyle.defaultTextStyle(color: Colors.black54), maxLines: 3) : Center(child: SizedBox(width: size.width / 2, child: AutoSizeText("Masukkan kode OTP yang telah kami kirimkan ke alamat email yang telah anda daftarkan", style: textStyle.defaultTextStyle(color: Colors.black54), maxLines: 3, textAlign: TextAlign.center))),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: orientation == Orientation.portrait ? double.infinity : size.width / 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: PinCodeTextField(
                          autoDisposeControllers: false,
                          appContext: context,
                          animationCurve: Curves.bounceInOut,
                          hapticFeedbackTypes: HapticFeedbackTypes.vibrate,
                          pastedTextStyle: TextStyle(
                            color: Colors.green.shade600,
                            fontWeight: FontWeight.bold,
                          ),
                          length: 4,
                          blinkWhenObscuring: true,
                          animationType: AnimationType.scale,
                          validator: (v) {
                            if (v!.length < 3) {
                              return "Please input OTP Code";
                            } else {
                              return null;
                            }
                          },
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.underline,
                            fieldHeight: 50,
                            fieldWidth: 40,
                            selectedColor: GlobalVariable.secondaryColor,
                            activeFillColor: Colors.white,
                            activeColor: GlobalVariable.secondaryColor,
                            inactiveColor: GlobalVariable.secondaryColor.withOpacity(0.5)
                          ),
                          cursorColor: Colors.black.withOpacity(0.5),
                          animationDuration: const Duration(milliseconds: 300),
                          controller: otpController,
                          keyboardType: TextInputType.number,
                          boxShadows: const [
                            BoxShadow(
                              offset: Offset(0, 1),
                              color: Colors.black12,
                              blurRadius: 10,
                            )
                          ],
                          onCompleted: (v) async {
                            if(kDebugMode) print(v);
                          },
                          onChanged: (value) {
                            debugPrint(value);
                            setState(() {
                              currentText = value;
                            });
                          },
                          beforeTextPaste: (text) {
                            debugPrint("Allowing to paste $text");
                            return true;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Obx(() {
                      if(countdowntime.value > 0){
                        return Text("Mohon tunggu ${countdowntime.value} detik untuk mengirim ulang kode OTP melalui email", style: textStyle.defaultTextStyle(color: Colors.black), textAlign: TextAlign.start);
                      }
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Tidak menerima kode OTP?", style: textStyle.defaultTextStyleMedium(fontSize: 14, color: Colors.black54)),
                          const SizedBox(width: 5),
                          Obx(() => kDefaultCupertinoTextButton(
                              onPressed: countdowntime.value > 0 ? null : (){
                                startTimer();
                              },
                              textColor: GlobalVariable.secondaryColor,
                              title: "Kirim Ulang"
                            ),
                          )
                        ],
                      );
                    }),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: orientation == Orientation.portrait ? double.infinity : size.width / 2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: GlobalVariable.secondaryColor,
                        ),
                        onPressed: (){
                          Get.offAll(() => const SignInProvider());
                        },
                        child: Text("Konfirmasi", style: textStyle.defaultTextStyleMedium(fontSize: 16, color: Colors.white))
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}