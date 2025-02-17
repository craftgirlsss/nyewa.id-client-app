import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:nyewadotid/src/components/button/cupertino_button.dart';
import 'package:nyewadotid/src/components/global/index.dart';
import 'package:nyewadotid/src/components/textsyle/index.dart';

class Utilities {
  final textStyle = GlobalTextStyle();

  static AnnotatedRegion defaultAnnotatedRegion({Widget? child}){
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarContrastEnforced: true,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent
      ),
      child: child!,
    );
  }

  Widget cardTitle({String? title}){
    return Row(
      children: [
        Container(
          width: 4,
          height: 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: GlobalVariable.secondaryColor
          ),
        ),
        const SizedBox(width: 8),
        AutoSizeText(title ?? "Unknown Title", style: textStyle.defaultTextStyleMedium(), minFontSize: 16, maxFontSize: 17, maxLines: 1, overflow: TextOverflow.clip)
      ],
    );
  }


  Widget floatingLoading() {
    return Container(
      color: CupertinoColors.black.withOpacity(0.3),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(229, 223, 221, 1),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(color: Colors.black54, offset: Offset(0, 5))
                ],
                image: const DecorationImage(image: AssetImage('assets/images/loading.gif'))
              ),
              child: const Center(child: Text("Loading", style: TextStyle(fontSize: 12))),
            ),
          ],
        ),
      ),
    );
  }

  Widget couponCard(context, {Function()? onPressed, Color? color, int? discount, String? titleDiscount}){
    final size = MediaQuery.of(context).size;
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
        margin: const EdgeInsets.all(7),
        constraints: BoxConstraints(
            maxWidth: size.width / 1.5,
            minWidth: size.width / 1.6
        ),
        decoration: BoxDecoration(
          color: color ?? GlobalVariable.secondaryColor.withOpacity(0.7),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AutoSizeText(titleDiscount ?? "Diskon Angkutan Darat", style: textStyle.defaultTextStyleMedium(fontSize: 14)),
                const SizedBox(width: 7),
                GestureDetector(
                    onTap: (){},
                    child: const Icon(Bootstrap.info_circle_fill, color: Colors.black, size: 18)
                )
              ],
            ),
            AutoSizeText("Diskon ${discount ?? 0}%", style: textStyle.defaultTextStyleMedium(fontSize: 32)),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  backgroundColor: Colors.white,
                  elevation: 0,
                ),
                onPressed: onPressed, label: Text("Ambil Voucher", style: textStyle.defaultTextStyleMedium(color: color ?? GlobalVariable.secondaryColor.withOpacity(0.7))), icon: Icon(Icons.keyboard_arrow_right, color: color ?? GlobalVariable.secondaryColor.withOpacity(0.7)), iconAlignment: IconAlignment.end)
          ],
        ),
      ),
    );
  }

  static Widget profilePhoto({String? urlPhoto, Function()? onPressed}){
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          color: Colors.white,
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              image: DecorationImage(image: urlPhoto == null ? const AssetImage('assets/images/no_image.png') : FileImage(File(urlPhoto)), fit: BoxFit.cover),
              boxShadow: const [BoxShadow(color: GlobalVariable.secondaryColor, blurRadius: 10)],
              border: Border.all(color: Colors.black12, width: 0.4),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: kDefaultCupertinoChild(
            onPressed: onPressed,
            child: const Icon(CupertinoIcons.add_circled_solid, size: 45, color: GlobalVariable.secondaryColor)
          )
        )
      ],
    );
  }
}

class SchedulePicker extends StatefulWidget {
  const SchedulePicker({super.key, this.dayName});
  final String? dayName;

  @override
  State<SchedulePicker> createState() => _SchedulePickerState();
}

class _SchedulePickerState extends State<SchedulePicker> {
  RxBool isActive = false.obs;
  RxString start = "".obs;
  RxString end = "".obs;

  Time _timeStart = Time(hour: 09, minute: 00, second: 00);
  Time _timeEnd = Time(hour: 05, minute: 00, second: 00);
  bool iosStyle = true;

  void onTimeChangedStart(Time newTime) {
    setState(() {
      _timeStart = newTime;
    });
  }

  void onTimeChangedEnd(Time newTime) {
    setState(() {
      _timeEnd = newTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: GlobalVariable.secondaryColor, width: 0.7),
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.dayName ?? "Senin", style: TextStyle(fontSize: 15, color: GlobalVariable.secondaryColor.withOpacity(0.9))),
                Obx(() => isActive.value ? Row(
                    children: [
                      Obx(() => 
                        kDefaultCupertinoTextButton(
                          title: start.value == "" ? "09:00 AM" : start.value,
                          onPressed: (){
                            Navigator.of(context).push(
                              showPicker(
                                context: context,
                                value: _timeStart,
                                sunrise: const TimeOfDay(hour: 6, minute: 0), // optional
                                sunset: const TimeOfDay(hour: 18, minute: 0), // optional
                                duskSpanInMinutes: 120, // optional
                                onChange: onTimeChangedStart,
                                onChangeDateTime: (DateTime p0) {
                                  start.value = DateFormat().add_jm().format(p0);
                                }
                              ),
                            );
                          },
                          textColor: GlobalVariable.secondaryColor,
                        ),
                      ),
                      const Text(" - ", style: TextStyle(color: GlobalVariable.secondaryColor, fontWeight: FontWeight.bold)),
                      Obx(() =>
                        kDefaultCupertinoTextButton(
                          title: end.value == "" ? "05:00 PM" : end.value,
                          onPressed: (){
                            Navigator.of(context).push(
                              showPicker(
                                context: context,
                                value: _timeEnd,
                                sunrise: const TimeOfDay(hour: 6, minute: 0), // optional
                                sunset: const TimeOfDay(hour: 18, minute: 0), // optional
                                duskSpanInMinutes: 120, // optional
                                onChange: onTimeChangedEnd,
                                onChangeDateTime: (DateTime p0) {
                                  end.value = DateFormat().add_jm().format(p0);
                                }
                              ),
                            );
                          },
                          textColor: GlobalVariable.secondaryColor,
                        ),
                      ),
                    ],
                  ) : Text("Tutup", style: TextStyle(fontSize: 13, color: GlobalVariable.secondaryColor.withOpacity(0.6))),
                )
              ],
            ),
          ),
          Obx(() => 
            Switch(
              trackOutlineColor: const WidgetStatePropertyAll(GlobalVariable.secondaryColor),
              activeColor: GlobalVariable.secondaryColor,
              thumbColor: const WidgetStatePropertyAll(GlobalVariable.secondaryColor),
              inactiveTrackColor: GlobalVariable.backgroundColor,
              value: isActive.value, 
              onChanged: (value) {
                isActive.value = !isActive.value;
              },
            )
          )
        ],
      ),
    );
  }
}