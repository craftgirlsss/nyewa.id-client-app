import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:nyewadotid/src/components/global/index.dart';
import 'package:nyewadotid/src/components/textsyle/index.dart';
import 'package:nyewadotid/src/components/utilities/utilities.dart';

class Bookings extends StatefulWidget {
  const Bookings({super.key});

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  final textStyle = GlobalTextStyle();
  final globalVariable = GlobalVariable();
  final utilities = Utilities();
  var menuSelected = 0.obs;
  var isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: globalVariable.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  width: size.width,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Obx(() => ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: menuSelected.value == 0 ? globalVariable.secondaryColor.withOpacity(0.2) : Colors.white, elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), onPressed: isLoading.value ? (){} : () {menuSelected.value = 0;}, child: Text("Upcoming", style: textStyle.defaultTextStyleBold(fontSize: 13, color: menuSelected.value == 0 ? globalVariable.secondaryColor : Colors.grey.shade400))))),
                      const SizedBox(width: 5),
                      Expanded(child: Obx(() => ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: menuSelected.value == 1 ? globalVariable.secondaryColor.withOpacity(0.2) : Colors.white, elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), onPressed: isLoading.value ? (){} : () {menuSelected.value = 1;}, child: Text("History", style: textStyle.defaultTextStyleBold(fontSize: 13, color: menuSelected.value == 1 ? globalVariable.secondaryColor : Colors.grey.shade400))))),
                      const SizedBox(width: 5),
                      Expanded(child: Obx(() => ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: menuSelected.value == 2 ? globalVariable.secondaryColor.withOpacity(0.2) : Colors.white, elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), onPressed:  isLoading.value ? (){} : () {menuSelected.value = 2;}, child: Text("Draft", style: textStyle.defaultTextStyleBold(fontSize: 13, color: menuSelected.value == 2 ? globalVariable.secondaryColor : Colors.grey.shade400))))),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Obx(() {
                  if(menuSelected.value == 0){
                    return runningBookings(length: 1);
                  }else if(menuSelected.value == 1){
                    return historyBooked();
                  }else{
                    return draftBook();
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  // running Booking
  Container runningBookings({int? length}){
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: utilities.cardTitle(title: "Bookings"),
          ),
          length == null || length == 0
            ? notAvailableBooked()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    cardItemBooked()
                  ],
                ),
          )
        ],
      ),
    );
  }

  // history Book
  Container historyBooked(){
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }

  // draft Booking
  Container draftBook(){
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }

  Container notAvailableBooked({String? title, String? message}){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      color: Colors.transparent,
      child: Column(
        children: [
          Icon(LineAwesome.sticky_note_solid, size: 80, color: globalVariable.secondaryColor),
          const SizedBox(height: 20),
          AutoSizeText(title ?? "Tidak ada booking aktif", style: textStyle.defaultTextStyleBold(), minFontSize: 17, maxFontSize: 18, textAlign: TextAlign.center),
          const SizedBox(height: 10),
          AutoSizeText(message ?? "Currently you don’t have any upcoming order. Place and track your orders from here.", style: textStyle.defaultTextStyleMedium(), minFontSize: 13, maxFontSize: 14, textAlign: TextAlign.center, maxLines: 3),
          const SizedBox(height: 10),
          ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: globalVariable.secondaryColor.withOpacity(0.2), elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), onPressed: () {}, child: Text("Lihat Semua Expedisi", style: textStyle.defaultTextStyleBold(fontSize: 14, color: globalVariable.secondaryColor)))
        ],
      ),
    );
  }

 CupertinoButton cardItemBooked({String? titleBooked, String? bookedID, int? statusBooked, String? companyName, TimeOfDay? startTime, TimeOfDay? endTime, DateTime? startDate, DateTime? endDate, String? serviceMemberID, String? typeOrder}){
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: (){},
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.black38,
            width: 0.3
          )
        ),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundColor: globalVariable.secondaryColor,
                child: const Icon(MingCute.air_condition_open_fill, color: Colors.white),
              ),
              title: AutoSizeText(titleBooked ?? "Unknown Booked Name", style: textStyle.defaultTextStyleMedium(), maxFontSize: 15, minFontSize: 14),
              subtitle: AutoSizeText("Booked ID: #${bookedID ?? 0}", style: textStyle.defaultTextStyleMedium(color: Colors.black45), minFontSize: 13, maxFontSize: 14),
            ),
            const Divider(color: Colors.black26, thickness: 0.3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Status", style: textStyle.defaultTextStyleMedium(color: Colors.black54, fontSize: 15)),
                statusContainer()
              ],
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                child: const Icon(EvaIcons.calendar, color: Colors.black45),
              ),
              title: AutoSizeText("$startTime - $endTime, $startDate", style: textStyle.defaultTextStyleMedium(), maxFontSize: 15, minFontSize: 14),
              subtitle: AutoSizeText("Terjadwal", style: textStyle.defaultTextStyleMedium(color: Colors.black45), minFontSize: 13, maxFontSize: 14),
            ),
          ],
        ),
      )
    );
  }

  Widget statusContainer({int? status}){
    String value = "";
    Color backgroundColor = Colors.orange;
    if(status == null || status == 0){
      value = "Pending";
      backgroundColor = Colors.orange;
    }else if(status == 1){
      value = "Selesai";
      backgroundColor = Colors.green;
    }else if(status == -1){
      value = "Dibatalkan";
      backgroundColor = Colors.redAccent;
    }else{
      value = "Tidak Diketahui";
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: backgroundColor.withOpacity(0.2)
      ),
      child: Text(value, style: textStyle.defaultTextStyleMedium(color: backgroundColor, fontSize: 14)
      )
    );
  }
}